import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            List {
                if !isLoggedIn {
                    NavigationLink(destination: SignInView(isLoggedIn: $isLoggedIn)) {
                        Text("ログイン")
                    }
                } else {
                    NavigationLink(destination: MyAccountUI(isLoggedIn: $isLoggedIn)) {
                        Text("Mypage")
                    }
                    NavigationLink(destination: LogOutUI(isLoggedIn: $isLoggedIn)) {
                        Text("ログアウト")
                    }
                }
            }
            .navigationTitle("メニュー")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showMenu = false
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding()
                    }
                }
            }
        }
    }
}


