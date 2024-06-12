import SwiftUI

struct SignInView: View {
    @Binding var isLoggedIn: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert = false     //アラートの表示
    
    var body: some View {
        VStack {
            TextField("ユーザー名", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("パスワード  英数字8文字以上", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("ログイン") {
                if let savedUsername = UserDefaults.standard.string(forKey: "username"),
                   let savedPassword = UserDefaults.standard.string(forKey: "password"),
                username == savedUsername && password == savedPassword {
                    isLoggedIn = true
                } else {
                    isShowingAlert = true   //ログインの失敗の時アラート表示
                }
            }
            .padding()
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("ログインできません"), message: Text("ユーザー名またはパスワードが間違っています。 アカウントの作成をしていない方は、新しいアカウントの作成からアカウントを作成してください"), dismissButton: .default(Text("OK!!")))
            }
            .navigationTitle("ログイン")
            .navigationBarTitleDisplayMode(.inline)
            
            NavigationLink(destination: SignUpView(isLoggedIn: $isLoggedIn)) {
                Text("新しいアカウントの作成")
            }
            .padding()
        }
    }
}

