//
//  CTitleScreen.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit

class CTitleScreen: ASDisplayNode {
    let title: ASTextNode
    init(title: String) {
        self.title = ASCustom.label(value: title, fontSize: 20, fontWeight: UIFont.Weight.bold)
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let inset = ASInsetLayoutSpec(insets: .init(top: 20, left: 10, bottom: 20, right: 10), child: self.title)
        return inset
    }
}
