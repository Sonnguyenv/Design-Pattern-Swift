//
//  BaseHeaderView.swift
//  DesignPattern
//
//  Created by SonNV MacMini on 17/08/2022.
//

import Foundation
import UIKit

protocol BaseHeaderDelegate: AnyObject {
    func actionButtonTapped()
}

class BaseHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    public let multicastAuthDelegate = MulticastDelegate<BaseHeaderDelegate>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        if let view = Bundle.main.loadNibNamed("BaseHeaderView", owner: self, options: nil)?.first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
    }
    
    @IBAction func actionClose(_ sender: Any) {
        self.multicastAuthDelegate.invokeForEachDelegate { delegate in
            delegate.actionButtonTapped()
        }
    }
}
