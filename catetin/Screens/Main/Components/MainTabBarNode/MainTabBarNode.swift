//
//  maintabbarnode.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import Foundation
import AsyncDisplayKit

class MainTabBarNode: ASDisplayNode {
    var nodepager: ASPagerNode?
    let datasource: [MainTabType] = [MainTabType.onGoing, MainTabType.selesai]
    let selector: MainTabBarSelectorNode = MainTabBarSelectorNode()
    
    override init() {
        super.init()
        self.style.flexGrow = 1
        self.automaticallyManagesSubnodes = true
        let pagerlayout: ASPagerFlowLayout = ASPagerFlowLayout()
        pagerlayout.scrollDirection = .horizontal
        pagerlayout.minimumLineSpacing = 0
        self.nodepager = ASPagerNode(collectionViewLayout: pagerlayout)
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
        let cell: MainTabNode = MainTabNode()
        cell.delegate = self
        cell.setupData(type: datasource[index])
        return cell
    }
}

extension MainTabBarNode: MainTabNodeDelegate {
    func callbackOnLoad(tabType: MainTabType) {
        print("active - \(tabType)")
    }
}
