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
    var tableview: MainTabTableNode?
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        tableview = MainTabTableNode()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wrap = ASWrapperLayoutSpec(layoutElement: self.tableview ?? ASDisplayNode())
        return wrap
    }
    
    func setupData(type: MainTabType) {
        tabType = type
    }
    
    override func didEnterVisibleState() {
        super.didEnterVisibleState()
        print("ACTIVE - \(tabType ?? MainTabType.onGoing)")
        tableview?.setTableData(type: tabType ?? MainTabType.onGoing)
        delegate?.callbackOnLoad(tabType: tabType ?? MainTabType.onGoing)
    }
}
