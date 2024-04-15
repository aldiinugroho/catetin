//
//  ASEditableTextfield.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit
import UIKit

let baseValue: CGFloat = 16

protocol ASCEditableTextNodeDelegate: AnyObject {
    func callbackOnChange(tag: String, values: String)
}

class ASCEditableTextNode: ASDisplayNode {
    
    weak var delegate: ASCEditableTextNodeDelegate?
    private var MyUITextField: ASDisplayNode
    private var tag: String
    private var baseFontSize: CGFloat? = baseValue
    private var editable: Bool? = true
    
    init(fontSize: CGFloat? = baseValue, placeholder: String? = "Placeholder", tag: String, editable: Bool? = true) {
        self.MyUITextField = ASDisplayNode()
        self.tag = tag
        self.baseFontSize = fontSize
        self.editable = editable
        super.init()
        let ctx = UITextField()
        ctx.isEnabled = editable ?? true
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: baseFontSize ?? baseValue),
            .foregroundColor: UIColor.gray
        ]
        ctx.attributedPlaceholder = NSAttributedString(string: placeholder ?? "Placeholder", attributes: attributes)
        ctx.delegate = self
        self.MyUITextField = ASDisplayNode { () -> UITextField in
            let ctx = ctx
            return ctx
        }
        self.automaticallyManagesSubnodes = true
        self.style.width = ASDimensionMake("100%")
        self.style.height = ASDimension(unit: .points, value: (baseFontSize ?? baseValue) + 5)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wrap = ASWrapperLayoutSpec(layoutElement: self.MyUITextField)
        return wrap
    }
}

extension ASCEditableTextNode: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.typingAttributes = [
            .font: UIFont.systemFont(ofSize: baseFontSize ?? baseValue),
            .foregroundColor: UIColor.black
        ]
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.callbackOnChange(tag: self.tag, values: textField.text ?? "")
    }
}
