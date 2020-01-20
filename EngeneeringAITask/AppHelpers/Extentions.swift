//
//  Extentions.swift
//  EngeneeringAITask
//
//  Created by VijenderBandari on 20/01/20.
//  Copyright © 2020 VijenderBandari. All rights reserved.
//

import UIKit

extension String{
    func convertdateToFormate(formate:String)->String{
                let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
               let date = dateFormatter.date(from: self)
               dateFormatter.dateFormat = formate
               return  dateFormatter.string(from: date!)
    }
}
