//
//  PostsTableview.swift
//  EngeneeringAITask
//
//  Created by VijenderBandari on 20/01/20.
//  Copyright © 2020 VijenderBandari. All rights reserved.
//

import UIKit

class PostsTableview: UITableView,UITableViewDelegate,UITableViewDataSource {
    var numberOfPost:[Posts]! // for number of rows
    var presentedInViewController : UIViewController!
    var pageNUmber : Int = 1;
    var totalNumberOfPages : Int = 1
    var selectedPagesCount : Int = 0
    
    // load when intiallay call service
    func loadeDataInTable(withNumberOfPost : [Posts], inController:UIViewController){
        self.register(UINib.init(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
        self.numberOfPost = withNumberOfPost
        self.presentedInViewController = inController
        self.setSeletSelectePostsCount()
        self.delegate = self
        self.dataSource = self
        self.reloadData()
        
    }
    // load data when auto load  to append data to tableview
    func autoLoadData(withPost:[Posts]){
        if(withPost.count == 0){
            return
        }
        self.numberOfPost = self.numberOfPost+withPost
        var loadIndexPaths = [IndexPath]()
        for index in self.numberOfRows(inSection: 0) ... self.numberOfPost.count-1{
            let indexPath = IndexPath.init(row: index, section: 0)
            loadIndexPaths.append(indexPath)
        }
        self.beginUpdates()
        self.insertRows(at: loadIndexPaths, with: .automatic)
        self.endUpdates()
    }
    // clear tableviewDate
    func clearAllData(){
        self.selectedPagesCount = 0
        self.pageNUmber = 1;
        self.totalNumberOfPages = 1
        self.setSeletSelectePostsCount()
    }
    
    // set selecte dpage count on counter tilte navigation bar
    func setSeletSelectePostsCount(){
        self.presentedInViewController.title = "Number of the selected posts : \(self.selectedPagesCount)"
    }
    
    
    //MARK:- Tableview Delegates And Data sources
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.numberOfPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  self.dequeueReusableCell(withIdentifier: "PostsTableViewCell") as! PostsTableViewCell
        cell.setValues(post: self.numberOfPost[indexPath.row])
        cell.selectionStyle = .none
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(self.numberOfPost.count - 1 == indexPath.row && pageNUmber < self.totalNumberOfPages){
            self.pageNUmber = self.pageNUmber + 1
            (self.presentedInViewController as! PostsViewController).serviceCalling(withURl: String(self.pageNUmber), isShowLoader: false)
            let spinner = UIActivityIndicatorView(style:UIActivityIndicatorView.Style.medium)
                   spinner.startAnimating()
                   spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
                   self.tableFooterView = spinner
            self.tableFooterView!.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // selcte and deselect data here
        let cell = self.cellForRow(at: indexPath) as! PostsTableViewCell
        self.numberOfPost[indexPath.row].isActiveAndDeactiveSelected = !self.numberOfPost[indexPath.row].isActiveAndDeactiveSelected
        cell.setValues(post: self.numberOfPost[indexPath.row])
        self.selectedPagesCount =  self.numberOfPost[indexPath.row].isActiveAndDeactiveSelected ? self.selectedPagesCount+1: self.selectedPagesCount-1
        self.setSeletSelectePostsCount()
    }

}
