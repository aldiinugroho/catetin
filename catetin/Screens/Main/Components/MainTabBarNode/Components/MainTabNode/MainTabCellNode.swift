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
    func callbackOnEnterState(tabType: MainTabType)
    func callbackOnExitState(tabType: MainTabType)
}

class MainTabCellNode: ASCellNode {
    var tabType: MainTabType?
    weak var delegate: MainTabNodeDelegate?
    var tableview: MainTabTableNode = MainTabTableNode()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wrap = ASWrapperLayoutSpec(layoutElement: self.tableview)
        return wrap
    }
    
    func setupData(type: MainTabType) {
        let dataOnProgress: [ModelPosting] = [
            ModelPosting(postingName: "John Elkan", postingTitle: "Minjem buat lebaran", postingValue: 50000000),
            ModelPosting(postingName: "John Lenon", postingTitle: "Minjem buat THR", postingValue: 10000000)
        ]
        let dataSelesai: [ModelPosting] = [
            ModelPosting(postingName: "John Elkan", postingTitle: "Main Saham", postingValue: 10000000),
            ModelPosting(postingName: "John Lenon", postingTitle: "Main BTC", postingValue: 23000000)
        ]
        tabType = type
        tableview.setTableData(data: type == MainTabType.onGoing ? dataOnProgress : dataSelesai)
    }
    
    override func didEnterVisibleState() {
        super.didEnterVisibleState()
        print("didEnterVisibleState - \(tabType ?? MainTabType.onGoing)")
        delegate?.callbackOnEnterState(tabType: tabType ?? MainTabType.onGoing)
    }
    
    override func didExitVisibleState() {
        super.didExitVisibleState()
        print("didExitVisibleState - \(tabType ?? MainTabType.onGoing)")
        delegate?.callbackOnExitState(tabType: tabType ?? MainTabType.onGoing)
    }
}
