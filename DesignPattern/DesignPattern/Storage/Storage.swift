//
//  Storage.swift
//  DesignPattern
//
//  Created by SonNV MacMini on 18/08/2022.
//

import Foundation

class Storage {
    func dismiss() {
        
    }
}

extension Storage: BaseHeaderDelegate {
    func actionButtonTapped() {
        self.dismiss()
    }
}
