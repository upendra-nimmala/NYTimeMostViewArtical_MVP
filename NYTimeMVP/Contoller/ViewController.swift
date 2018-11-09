//
//  ViewController.swift
//  NYTimeMVP
//
//  Created by Upendra Nimmala on 09/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var articalsTabelView: UITableView!
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    private var items = [Article]()
    private var presenter = NYTimeMostViewedArticalsPresenter()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(view: self as NYTimeArticalListView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getNYTimeMostViewedArticals()
        articalsTabelView.delegate = self
        articalsTabelView.dataSource = self
        activityIndicator.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        activityIndicator.color = UIColor.gray
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showActivityIndicator() {

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK - UITableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticalCell", for: indexPath)
            as! NYTimeArticalsTableViewCell
        cell.configure(item: items[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    // MARK - UITableView DataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView {
        case self.articalsTabelView:
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let a_viewController: NYTimeArticalDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "nyTimeArticalDetailsViewController") as! NYTimeArticalDetailsViewController
            a_viewController.articalDetailsurl = items[indexPath.row].url
            navigationController?.pushViewController(a_viewController, animated: true)
            break
        default:
            break
        }
    }
    
}

extension ViewController: NYTimeArticalListView {

    
    func stopAnimator() {
        activityIndicator.stopAnimating()
    }
    
    func getMostViewedArticals(articals: Results) {
        self.items = articals.results
        articalsTabelView.reloadData()
        
    }
    

}



