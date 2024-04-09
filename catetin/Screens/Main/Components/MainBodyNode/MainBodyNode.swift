//
//  MainBodyNode.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import Foundation
import AsyncDisplayKit

class MainBodyNode: ASDisplayNode {
    
    let header: ASDisplayNode = CHeader()
    let pager: MainTabBarNode = MainTabBarNode()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [
            self.header,
            self.pager
        ])
        return stack
    }
}
