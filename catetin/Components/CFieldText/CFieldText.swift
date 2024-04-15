//
//  CFieldText.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit

protocol CFieldTextDelegate: AnyObject {
    func callbackOnChange(tag: String, values: String)
}

class CFieldText: ASDisplayNode {
    
    var field: ASCEditableTextNode
    weak var delegate: CFieldTextDelegate?
    
    init(tag: String, placeholder: String, editable: Bool? = true) {
        self.field = ASCEditableTextNode(placeholder: placeholder, tag: tag, editable: editable)
        super.init()
        self.automaticallyManagesSubnodes = true
        self.style.width = ASDimensionMake("100%")
        self.borderWidth = 1
        self.borderColor = UIColor.gray.cgColor
        self.cornerRadius = 5
        self.field.delegate = self
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let inset = ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 10), child: self.field)
        return inset
    }
}

extension CFieldText: ASCEditableTextNodeDelegate {
    func callbackOnChange(tag: String, values: String) {
        delegate?.callbackOnChange(tag: tag, values: values)
    }
}
