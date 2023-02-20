import Foundation
import SwiftUI
import WebKit

struct LiveView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
        
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string:"https://player.twitch.tv/?channel=\(videoID)") else
            {return}
            
           // uiView.scrollView.isScrollEnabled = false
            uiView.load(URLRequest(url: youtubeURL))
            
        }
}
