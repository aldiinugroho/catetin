//
//  MainTabOnGoingNode.swift
//  catetin
//
//  Created by aldinugroho on 09/04/24.
//

import Foundation
import AsyncDisplayKit

enum MainTabType {
    case onGoing
    case selesai
}

protocol MainTabNodeDelegate: AnyObject {
    func callbackOnLoad(tabType: MainTabType)
}

class MainTabNode: ASCellNode {
    var tabType: MainTabType?
    weak var delegate: MainTabNodeDelegate?
    
    override init() {
        super.init()
    }
    
    func setupData(type: MainTabType) {
        tabType = type
        if type == MainTabType.onGoing {
            self.backgroundColor = .systemBlue
        } else {
            self.backgroundColor = .systemRed
        }
    }
    
    override func didEnterVisibleState() {
        super.didEnterVisibleState()
        delegate?.callbackOnLoad(tabType: tabType ?? MainTabType.onGoing)
    }
}
