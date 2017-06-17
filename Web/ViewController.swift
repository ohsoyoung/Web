//
//  ViewController.swift
//  Web
//
//  Created by 오소영 on 2017. 6. 17..
//  Copyright © 2017년 오소영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: UIWebView!
    @IBOutlet var myIndicator: UIActivityIndicatorView!
    
    //웹페이지를 보여주는 함수 (url 이용)
    func loadWebPage(_ url: String) {
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        myWebView.loadRequest(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.delegate = self
        loadWebPage("http://2sam.net")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //액티비티 인디케이터 동작 시작
    func webViewDidStartLoad(_ webView: UIWebView) {
        myIndicator.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        myIndicator.stopAnimating()
    }
    
    @IBAction func btnGoToUrl(_ sender: UIButton) {
        let myUrl = txtUrl.text!
        txtUrl.text = " "
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://young21story.tistory.com")
    }

    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    
    @IBAction func btnLoadHtml(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"http://m.naver.com\">네이버</a> 로 이동!</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadFile(_ sender: UIButton) {
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        loadWebPage(filePath!)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

