//
//  NikonikoUI.swift
//  None

import SwiftUI
import WebKit

struct NikonikoView: View {
    var body: some View {
        GeometryReader { geometry in
            WebView6(url: URL(string: "https://ch.nicovideo.jp/marasy")!)
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("まらしぃチャンネル")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WebView6: UIViewRepresentable {
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
    NikonikoView()
}
