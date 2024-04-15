//
//  CreatePosting.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit

class CreatePosting: ASDKViewController<ASDisplayNode> {
    let mainnode: ASDisplayNode = ASDisplayNode()
    
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
