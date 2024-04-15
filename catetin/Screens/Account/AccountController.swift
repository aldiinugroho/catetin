//
//  AccountController.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit

class AccountController: ASDKViewController<ASDisplayNode> {
    var mainnode: AccountBodyController?
    
    override init() {
        super.init(node: ASDisplayNode())
        self.mainnode = AccountBodyController(context: self)
        node.backgroundColor = .baseGray
        node.automaticallyManagesSubnodes = true
        node.layoutSpecBlock = {_,_ -> ASLayoutSpec in
            return ASInsetLayoutSpec(insets: .zero, child: self.mainnode ?? ASDisplayNode())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
