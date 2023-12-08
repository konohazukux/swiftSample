//
//  TCA_Test_1205Tests.swift
//  TCA_Test_1205Tests
//

@_spi(Internals) import ComposableArchitecture
import XCTest

@MainActor
final class TCA_Test_1205Tests: XCTestCase {

  func testStackStateSubscriptCase() throws {
    enum Element: Equatable {
      case int(Int)
      case text(String)
    }
    
    var stack = StackState<Element>([.int(42)])  // OK
    //var stack = StackState<Element>([.text("message ....")])  // NG
    //var stack = StackState<Element>([.int(42), .int(44)])
    //var stack = StackState<Element>([.int(42), .text("message ....")])
    //var stack = StackState<Element>([.text("message ...."), .int(42)])
    
    
    stack[id: 0, case: /Element.int]? += 1
    XCTAssertEqual(stack[id: 0], .int(43))
    
    stack[id: 0, case: /Element.int] = nil
    XCTAssertTrue(stack.isEmpty)
    
  }
 
  func testStackStateSubscriptCase_Unexpected() {
    enum Element: Equatable {
      case int(Int)
      case text(String)
    }
    
    var stack = StackState<Element>([.int(42)])
    XCTExpectFailure {
      stack[id: 0, case: /Element.text]?.append("!")
    } issueMatcher: {
      $0.compactDescription == """
          Can't modify unrelated case "int
          "
          """
    }
    
  }
 
  func testPresent() {
    
    struct Child: Reducer {
      struct State: Equatable {
        count = 0
      }
      enum Action: Equatable {
        case decrementButtonTapped
        case incrementButtonTapped
      }
      var body: some ReducerOf<Self> {
        Reduce { state, action in
          switch action {
          case .decrementButtonTapped:
            state.count += 1
            return .none
          case .incrementButtonTapped:
            state.count -= 1
            return .none
          }
        }
      }
    }
    
    struct Parent: Reducer {
      struct State: Equatable {
        var children = StackState<Child.State>
      }
      enum Action: Equatable {
        case children: StackAction<Child.State, Child.Action>
        case pushChild
      }
      var body: some ReducerOf<Self> {
        Reduce { state, action in
          switch action {
          case .children:
            return .none
          case .pushChild:
            state.children.append(Child.State())
            return .none
          }
        }
        .forEach(\.children, action: \Action.children) {
          Child()
        }
      }
      
      let store = TestStore(initialState: Parent.State()) {
        Parent()
      }
      
      await store.send(.pushChild) {
        $0.children.append(Child.State())
      }
      
    }
    
    
  }
  
  
  
}
