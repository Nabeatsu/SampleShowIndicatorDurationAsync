//
//  ViewController.swift
//  ShowIndicatorDurationAsync
//
//  Created by 田辺信之 on 2018/09/28.
//  Copyright © 2018年 田辺信之. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapSynchronouButton(_ sender: Any) {
        let alert = UIAlertController.showIndicatorAlert(viewController: self, message: "uploading")

        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            alert.message = "Please wait a little bit"
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
    }
}



extension UIAlertController {
    class func showIndicatorAlert(viewController: UIViewController, message: String) -> UIAlertController {
        let alert: UIAlertController = self.init(title: nil, message: message, preferredStyle: .alert)
        // add indicator
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.center = CGPoint(x: 25.0, y: 30.0)
        alert.view.addSubview(indicator)
        DispatchQueue.main.async {
            indicator.startAnimating()
            viewController.present(alert, animated: true, completion: nil)
        }
        return alert
    }
}
