//
//  NYTimeArticalDetailsViewController.swift
//  NYTimeMVP
//
//  Created by Upendra Nimmala on 09/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import UIKit

class NYTimeArticalDetailsViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
     private var presenter = NYTimeArticalDetailPresenter()
    var articalDetailsurl : String?
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(view: self as NYTimeArticalDetailsView)
        presenter.getNYTimeMostViewedArticalURL()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        activityIndicator.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        activityIndicator.color = UIColor.gray
        self.view.addSubview(activityIndicator)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension NYTimeArticalDetailsViewController: NYTimeArticalDetailsView {
    
    func loadMostViewedArticalURL() {
        let url = URL (string: articalDetailsurl!)
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
    }
}

extension NYTimeArticalDetailsViewController: UIWebViewDelegate {
    

    internal func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    internal func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
            print(error)
            activityIndicator.stopAnimating()
        
    }
    
    internal   func webViewDidFinishLoad(_ webView: UIWebView)
    {
        activityIndicator.stopAnimating()
    }
}
