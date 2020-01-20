//
//  ServiceManager.swift
//  EngeneeringAITask
//
//  Created by VijenderBandari on 20/01/20.
//  Copyright © 2020 VijenderBandari. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {
    //base URL
    var baseURL : String = "https://hn.algolia.com/api/v1/search_by_date?tags=story&page="
    weak var serviceMangerDelage : serviceManagerDelegate?
    
    // get mothod to get data from the url
    func getDataFromService(withURL:String,withDelegate:UIViewController,isLoader:Bool){
        if(isLoader){
            LoadingOverlay.shared.showOverlay(view: withDelegate.view)
        }
        serviceMangerDelage = (withDelegate as! serviceManagerDelegate)
        URLSession.shared.dataTask(with: URL.init(string: self.baseURL+withURL)!) { data, response, error in
            LoadingOverlay.shared.hideOverlayView()
           if let data = data {
            let jsonData = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
            self.serviceMangerDelage?.serviceResponseData(responseObject: jsonData)
           }else{
            self.serviceMangerDelage?.serviceFailtoLoading()
            }
        }.resume()
    }
}

protocol serviceManagerDelegate:class {
    func serviceResponseData(responseObject : [String : Any])
    func serviceFailtoLoading()
}
