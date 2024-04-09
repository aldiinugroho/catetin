//
//  CHeader.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import Foundation
import AsyncDisplayKit

class CHeader: ASDisplayNode {
    
    lazy var boxdisplay: ASDisplayNode = {
        let ctx = ASDisplayNode()
        ctx.style.width = ASDimensionMake("100%")
        let height = Utilssize.getHeight() * 0.08
        ctx.style.height = ASDimension(unit: .points, value: height)
        ctx.backgroundColor = .baseYellow
        return ctx
    }()
    
    override init() {
        super.init()
        self.backgroundColor = .baseYellow
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: Utilssafearea.top(), left: 0, bottom: 0, right: 0), child: self.boxdisplay)
        return inset
    }
}
