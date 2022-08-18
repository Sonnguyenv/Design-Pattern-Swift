//
//  Coordinator.swift
//  DesignPattern
//
//  Created by SonNV MacMini on 18/08/2022.
//

import Foundation
import UIKit

class Coordinator {
    
    weak var navigationController: UINavigationController?
}

extension Coordinator: BaseHeaderDelegate {
    func actionButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
