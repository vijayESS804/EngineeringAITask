//
//  LoderView.swift
//  EngeneeringAITask
//
//  Created by VijenderBandari on 20/01/20.
//  Copyright © 2020 VijenderBandari. All rights reserved.
//

import UIKit

public class LoadingOverlay{
var overlayView = UIView()
var activityIndicator = UIActivityIndicatorView()

class var shared: LoadingOverlay {
    struct Static {
        static let instance: LoadingOverlay = LoadingOverlay()
    }
    return Static.instance
}

    public func showOverlay(view: UIView) {
        overlayView.frame = CGRect.init(x: 0, y: 0, width: 80, height: 80)
        overlayView.center = view.center
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.center =  CGPoint.init(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)

        activityIndicator.startAnimating()
    }

    public func hideOverlayView() {
        DispatchQueue.main.sync {
            activityIndicator.stopAnimating()
            overlayView.removeFromSuperview()
        }
        
    }
}
