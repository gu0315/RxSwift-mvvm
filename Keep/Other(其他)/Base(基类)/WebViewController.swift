//
//  WebViewController.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 7/19/18.
//  Copyright © 2018 Khoren Markosyan. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: ViewController<ViewModel> {

    lazy var webView: WKWebView = {

        let webView = WKWebView(frame: .zero)
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    override func makeUI() {
        super.makeUI()
        view.addSubview(webView)
    }

    func loadURL(_ urlString: String?) {

        guard
            let urlString = urlString,
            let url = URL(string: urlString)
        else { return }
        webView.load(URLRequest(url: url))
    }
}
