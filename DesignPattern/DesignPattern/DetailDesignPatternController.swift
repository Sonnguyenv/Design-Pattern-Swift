//
//  DetailDesignPatternController.swift
//  DesignPattern
//
//  Created by SonNV MacMini on 17/08/2022.
//

import UIKit

class DetailDesignPatternController: BaseViewController {
    @IBOutlet weak var headerView: BaseHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.multicastAuthDelegate.add(delegate: coordinator)
    }
}
