//
//  WalkhomePendingController.swift
//  Walkhome
//
//  Created by Ozzie Kirkby on 2017-10-02.
//  Copyright © 2017 kirkbyo. All rights reserved.
//

import UIKit

class WalkhomePendingController: UIViewController {
    @IBOutlet weak var walkhomeInformationView: UIView!
    @IBOutlet weak var messageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShadow(view: walkhomeInformationView)
        setShadow(view: messageView)
        
        let gradientView = GradientView()
        gradientView.frame = CGRect(x: 0, y: self.view.frame.height - 300, width: self.view.frame.width, height: 300)
        // Set the gradient colors
        gradientView.colors = [UIColor.white, UIColor(red:0.820, green:0.937, blue:1.000, alpha:1.000)]
        view.insertSubview(gradientView, at: 0)
    }
    
    func setShadow(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(red:0.643, green:0.643, blue:0.643, alpha:1.000).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
    }
}
