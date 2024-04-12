//
//  maintabbarnode.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import Foundation
import AsyncDisplayKit

class MainTabBarNode: ASDisplayNode {
    var pagerlayout: ASPagerFlowLayout = ASPagerFlowLayout()
    var nodepager: ASPagerNode?
    let datasource: [MainTabType] = [MainTabType.onGoing, MainTabType.selesai]
    var selector: MainTabBarSelectorNode = MainTabBarSelectorNode()
    var selectortab: MainTabType?
    
    override init() {
        super.init()
        self.style.flexGrow = 1
        self.automaticallyManagesSubnodes = true
        pagerlayout.scrollDirection = .horizontal
        pagerlayout.minimumLineSpacing = 0
        self.nodepager = ASPagerNode(collectionViewLayout: pagerlayout)
        self.nodepager?.backgroundColor = .baseGray
        self.nodepager?.allowsAutomaticInsetsAdjustment = true
        self.nodepager?.setDelegate(self)
        self.nodepager?.setDataSource(self)
        self.selector.delegate = self
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wrap = ASWrapperLayoutSpec(layoutElement: self.nodepager!)
        wrap.style.flexGrow = 1
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [
            self.selector,
            wrap
        ])
        return stack
    }
}

extension MainTabBarNode: MainTabBarSelectorNodeDelegate {
    func callbackOnTap(type: MainTabType) {
        switch type {
        case .onGoing:
            self.nodepager?.scrollToPage(at: 0, animated: true)
        case .selesai:
            self.nodepager?.scrollToPage(at: 1, animated: true)
        }
    }
}

extension MainTabBarNode: ASPagerDelegate, ASPagerDataSource {
    func numberOfPages(in pagerNode: ASPagerNode) -> Int {
        return datasource.count
    }
    
    func pagerNode(_ pagerNode: ASPagerNode, nodeAt index: Int) -> ASCellNode {
        let cell: MainTabCellNode = MainTabCellNode()
        cell.delegate = self
        cell.setupData(type: datasource[index])
        return cell
    }
}

extension MainTabBarNode: MainTabNodeDelegate {
    func callbackOnEnterState(tabType: MainTabType) {
        selectortab = tabType
        selector.setActiveBold(type: tabType)
        selector.layoutIfNeeded()
        selector.setNeedsLayout()
    }
    
    func callbackOnExitState(tabType: MainTabType) {
        guard selectortab != nil else { return }
        guard tabType == selectortab else { return }
        selector.setActiveBold(type: tabType == MainTabType.onGoing ? MainTabType.selesai : MainTabType.onGoing)
        selector.layoutIfNeeded()
        selector.setNeedsLayout()
    }
}
