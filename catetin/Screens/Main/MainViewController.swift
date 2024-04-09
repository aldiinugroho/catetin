//
//  ViewController.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import UIKit
import AsyncDisplayKit

class MainViewController: ASDKViewController<ASDisplayNode> {
    
    let mainbodynode: MainBodyNode = MainBodyNode()
    
    override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = UIColor.baseGray
        node.layoutSpecBlock = {_,_ -> ASLayoutSpec in
            return ASInsetLayoutSpec(insets: .zero, child: self.mainbodynode)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
