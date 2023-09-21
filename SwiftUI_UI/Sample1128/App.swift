import SwiftUI

@main
struct MyApp: App {
  var body: some Scene {
    WindowGroup {
      MyView()
    }
  }
}

struct MyView_Previews: PreviewProvider {
  static var previews: some View {
    MyView()
  }
}

struct MyView: View {
  var body: some View {
    NavigationStack {
        VStack(alignment: .leading, spacing: 0) {
          VStack {
            Text("ユーザー名")
              .font(.system(size: 12))
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
          }
          .padding([.bottom], 10)
          VStack {
            Text("ユーザーA")
              .font(.system(size: 16))
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
              .padding(10)
              .background(Color.white)
              .clipShape(RoundedRectangle(cornerRadius: 2))
          }
          .padding(.bottom, 20)
          VStack {
            Text("memo")
              .font(.system(size: 12))
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
          }
          .padding([.bottom], 10)
          VStack {
            Text("メモ１２３４５６７８９０１２３４５６７８９００１１２３４５６７８９０１２３４５６７８９０")
              .font(.system(size: 16))
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
              .padding(10)
              .background(Color.white)
              .clipShape(RoundedRectangle(cornerRadius: 2))
          }
          .padding(.bottom, 20)
          Spacer()
        }
        .padding([.leading, .top, .trailing, .bottom], 20)
        .frame(maxWidth: .infinity)
        .navigationTitle("User")
        .background(Color.init(red: 0.97, green: 0.97, blue: 0.97))
      }
    
    }
}


