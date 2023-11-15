//
//  Sample1128Tests.swift
//  Sample1128Tests
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//


@_spi(Internals) import ComposableArchitecture
import XCTest
@testable import Sample1128

@MainActor
class Sample1128Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  
  func testEnumChild() async {
    struct Child: Reducer {
      struct State: Equatable {
        var count = 0
      }
      enum Action: Equatable {
        case closeButtonTapped
        case incrementButtonTapped
        case onAppear
      }
      @Dependency(\.dismiss) var dismiss
      var body: some Reducer<State, Action> {
        Reduce { state, action in
          switch action {
          case .closeButtonTapped:
            return .run { _ in
              await self.dismiss()
            }
          case .incrementButtonTapped:
            state.count += 1
            return .none
          case .onAppear:
            return .run { _ in
              try await Task.never()
            }
          }
        }
      }
    }
    struct Path: Reducer {
      enum State: Equatable {
        case child1(Child.State)
        case child2(Child.State)
      }
      enum Action: Equatable {
        case child1(Child.Action)
        case child2(Child.Action)
      }
      var body: some ReducerOf<Self> {
        Scope(state: /State.child1, action: /Action.child1) {
          Child()
        }
        Scope(state: /State.child2, action: /Action.child2) {
          Child()
        }
      }
    }
    struct Parent: Reducer {
      struct State: Equatable {
        var path = StackState<Path.State>()
      }
      enum Action: Equatable {
        case path(StackAction<Path.State, Path.Action>)
        case pushChild1
        case pushChild2
      }
      var body: some ReducerOf<Self> {
        Reduce { state, action in
          switch action {
          case .path:
            return .none
          case .pushChild1:
            state.path.append(.child1(Child.State()))
            return .none
          case .pushChild2:
            state.path.append(.child2(Child.State()))
            return .none
          }
        }
        .forEach(\.path, action: /Action.path) {
          Path()
        }
      }
    }

    let store = TestStore(initialState: Parent.State()) {
      Parent()
    }
    await store.send(.pushChild1) {
      $0.path.append(.child1(Child.State()))
    }
    await store.send(.path(.element(id: 0, action: .child1(.onAppear))))
    await store.send(.pushChild2) {
      $0.path.append(.child2(Child.State()))
    }
    await store.send(.path(.element(id: 1, action: .child2(.onAppear))))
    await store.send(.path(.popFrom(id: 0))) {
      $0.path.removeAll()
    }
  }
  
}
