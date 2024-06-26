//
//  ViewController.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import UIKit
import AsyncDisplayKit

class MainViewController: ASDKViewController<ASDisplayNode> {
    
    var mainnode: MainBodyNode?
    
    override init() {
        super.init(node: ASDisplayNode())
        self.mainnode = MainBodyNode(context: self)
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = UIColor.baseGray
        node.layoutSpecBlock = {_,_ -> ASLayoutSpec in
            return ASInsetLayoutSpec(insets: .zero, child: self.mainnode ?? ASDisplayNode())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
