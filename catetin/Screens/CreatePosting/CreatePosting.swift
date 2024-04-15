//
//  CreatePosting.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit

class CreatePosting: ASDKViewController<ASDisplayNode> {
    var mainnode: CreatePostingBodyNode?
    
    override init() {
        super.init(node: ASDisplayNode())
        self.mainnode = CreatePostingBodyNode(context: self)
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = UIColor.baseGray
        node.layoutSpecBlock = {_,_ -> ASLayoutSpec in
            return ASInsetLayoutSpec(insets: .zero, child: self.mainnode ?? ASDisplayNode())
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.hideNavigationBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
