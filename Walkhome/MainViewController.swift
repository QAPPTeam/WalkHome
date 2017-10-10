//
//  MainViewController.swift
//  Walkhome
//
//  Created by Ozzie Kirkby on 2017-10-02.
//  Copyright © 2017 kirkbyo. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var requestAlertView: UIView!
    @IBOutlet weak var requestAlertViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayRequestAlert(show: false, animate: false)
    }
    
    func setShadow(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(red:0.643, green:0.643, blue:0.643, alpha:1.000).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
    }
    
    // MARK: - Actions
    @IBAction func confrimRequestAction() {
        self.performSegue(withIdentifier: "matchController", sender: nil)
        displayRequestAlert(show: false)
    }
    
    @IBAction func cancelRequestAction() {
        displayRequestAlert(show: false)
    }
    
    func displayRequestAlert(show: Bool, animate: Bool=true) {
        if show {
            self.requestAlertViewBottomConstraint.constant = 14
        } else {
            self.requestAlertViewBottomConstraint.constant = -160
        }
        
        func animateView() {
            if show {
                self.collectionView.alpha = 0.0
            } else {
                self.collectionView.alpha = 1.0
            }
            self.view.layoutIfNeeded()
        }
        if animate {
            UIView.animate(withDuration: 0.4, animations: animateView)
        } else { animateView() }
    }
    
    @IBAction func personelButton() {
        let alertController = UIAlertController(title: "Walkhome ID", message: "Enter your walkhome personel identification number:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields?[0] {
                // store your data
                UserDefaults.standard.set(field.text, forKey: "walkhomeID")
                UserDefaults.standard.synchronize()
            } else {
                // user did not fill field
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Personel ID #"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - CollectionView Delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return CGSize(width: 320, height: 100)
        case 1:
            return CGSize(width: 100, height: 100)
        default:
            return CGSize(width: 320, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            displayRequestAlert(show: true)
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var identifier = "requestCell"
        if indexPath.item == 1 {
            identifier = "callCell"
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: IndexPath(item: indexPath.item, section: indexPath.section))
        cell.layer.cornerRadius = 5
        return cell
    }
}
