//
//  PostsViewController.swift
//  EngeneeringAITask
//
//  Created by VijenderBandari on 20/01/20.
//  Copyright © 2020 VijenderBandari. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController,serviceManagerDelegate {

    var refreshPageController = UIRefreshControl()

    @IBOutlet weak var postsTableView: PostsTableview!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postsTableView.tableFooterView = UIView()
       self.serviceCalling(withURl: "1", isShowLoader: true)
        // add target to refresh controller
        self.refreshPageController.addTarget(self, action: #selector(self.pullToRefreshMethod(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            self.postsTableView.refreshControl = self.refreshPageController
        } else {
            self.postsTableView.addSubview(self.refreshPageController)
        }
    }
    
    //Pull to refresh controller target method
    @objc func pullToRefreshMethod(_ sender:UIRefreshControl){
        self.postsTableView.clearAllData()
        self.serviceCalling(withURl: "1", isShowLoader: false)
    }
    
    //servicecalling method
    func serviceCalling(withURl: String ,isShowLoader : Bool){
    ServiceManager().getDataFromService(withURL: withURl, withDelegate: self, isLoader: isShowLoader)
    }

    //Get service response method
    func serviceResponseData(responseObject: [String : Any]) {
        DispatchQueue.main.sync {
            self.postsTableView.tableFooterView?.isHidden = true
            self.refreshPageController.endRefreshing()
        if(self.postsTableView.pageNUmber == 1){
            self.postsTableView.totalNumberOfPages = responseObject["nbPages"] as! Int
        self.postsTableView.loadeDataInTable(withNumberOfPost: CommnMethods().convertDictToPostsModel(withDict: responseObject["hits"] as! [[String : Any]]), inController: self)
        }else{
            self.postsTableView.autoLoadData(withPost: CommnMethods().convertDictToPostsModel(withDict: responseObject["hits"] as! [[String : Any]]))
            }
    }
    }
    func serviceFailtoLoading() {
       }
    
}
