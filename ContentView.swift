import SwiftUI
import WebKit

struct ContentView1: View {
    @State private var showMenu = false
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                        NavigationLink(destination: NikonikoView()){
                            Image("buttonImage4")
                                .resizable()
                                .frame(width: 250 ,height: 250)
                                .padding()
                        }
                        NavigationLink(destination: ePlusView()) {
                            Image("buttonImage2")
                                .resizable()
                                .frame(width: 430, height: 260)
                                .padding()
                        }
                        NavigationLink(destination: MusicUI()) {
                            Image("buttonImage3")
                                .resizable()
                                .frame(width: 400,height: 225)
                                .padding()
                            
                        }
                        NavigationLink(destination: SiteView()) {
                            Image("buttonImage")
                                .resizable()
                                .frame(width: 450, height: 230)
                                .padding()
                        }
                }
                .navigationTitle("ホーム")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showMenu.toggle()
                        }){
                            Image(systemName: "line.horizontal.3")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .sheet(isPresented: $showMenu){
                    MenuView(showMenu: $showMenu, isLoggedIn: $isLoggedIn)
                }
            }
        }
    }
}
#Preview {
    ContentView1()
}

