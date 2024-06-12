//
//  secondUI.swift
//  None


import SwiftUI
import WebKit

struct SiteView: View {
    var body: some View {
        GeometryReader { geometry in
            WebView1(url: URL(string: "https://marasy8.jp")!)
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("まらしぃ公式サイト")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WebView1: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        webView.contentMode = .scaleAspectFill
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

#Preview {
    SiteView()
}
