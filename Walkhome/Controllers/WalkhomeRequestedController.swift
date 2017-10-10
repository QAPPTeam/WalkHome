//
//  WalkhomeRequestedController.swift
//  Walkhome
//
//  Created by Ozzie Kirkby on 2017-10-07.
//  Copyright © 2017 kirkbyo. All rights reserved.
//

import UIKit

class WalkhomeRequestedController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //self.performSegue(withIdentifier: "matchController", sender: nil)
        }
    }
}
