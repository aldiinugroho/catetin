//
//  AccountBodyController.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit

class AccountBodyController: ASDisplayNode {
    var header: CHeader?
    let context: ASDKViewController<ASDisplayNode>
    
    init(context: ASDKViewController<ASDisplayNode>) {
        self.context = context
        super.init()
        self.automaticallyManagesSubnodes = true
        setContext()
    }
    
    func setContext() {
        self.header = CHeader(context: context)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [
            self.header ?? ASDisplayNode()
        ])
        return stack
    }
}
