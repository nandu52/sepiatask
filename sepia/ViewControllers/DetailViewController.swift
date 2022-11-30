//
//  DetailViewController.swift
//  sepia
//
//  Created by Kandula Anand kumar on 30/11/22.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {

  var webView: WKWebView!
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        self.view = webView
        let url = URL(string: url)
        let requestObj = URLRequest(url: url! as URL)
        webView.load(requestObj)
    }
}
