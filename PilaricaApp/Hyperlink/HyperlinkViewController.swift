//
//  HyperlinkViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 19/01/23.
//

import UIKit
import WebKit

class HyperlinkViewController: UIViewController, UITextViewDelegate, WKNavigationDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var hidedWebView: WKWebView!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.delegate = self
        hidedWebView.navigationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let urlString:String = "https://www.youtube.com/watch?v=GtxlpBuMsNY"
        let url: URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest (url: url)
        hidedWebView.load(urlRequest)
        activityIndicatorView.startAnimating()
        urlTextField.text = urlString
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicatorView.startAnimating()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString:String = urlTextField.text!
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        hidedWebView.load(urlRequest)
        urlTextField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
