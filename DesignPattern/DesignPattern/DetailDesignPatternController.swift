//
//  DetailDesignPatternController.swift
//  DesignPattern
//
//  Created by SonNV MacMini on 17/08/2022.
//

import UIKit

class DetailDesignPatternController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
