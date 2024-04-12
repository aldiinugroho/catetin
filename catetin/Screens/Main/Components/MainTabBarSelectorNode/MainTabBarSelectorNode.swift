//
//  MainTabBarSelectorMain.swift
//  catetin
//
//  Created by aldinugroho on 09/04/24.
//

import Foundation
import AsyncDisplayKit

protocol MainTabBarSelectorNodeDelegate: AnyObject {
    func callbackOnTap(type: MainTabType)
}

class MainTabBarSelectorNode: ASDisplayNode {
    weak var delegate: MainTabBarSelectorNodeDelegate?
    
    var tv1: ASTextNode = ASCustom.label(value: "On Going", tag: 1)
    var tv2: ASTextNode = ASCustom.label(value: "Selesai", tag: 2)
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        setupNode()
        setupGestureRecognizer()
    }
    
    func setActiveBold(type: MainTabType) {
        if type == MainTabType.onGoing {
            tv1 = ASCustom.label(value: "On Going", fontWeight: UIFont.Weight.bold, tag: 1)
            tv2 = ASCustom.label(value: "Selesai", fontWeight: UIFont.Weight.regular, tag: 2)
        }
        if type == MainTabType.selesai {
            tv1 = ASCustom.label(value: "On Going", fontWeight: UIFont.Weight.regular, tag: 1)
            tv2 = ASCustom.label(value: "Selesai", fontWeight: UIFont.Weight.bold, tag: 2)
        }
        setupGestureRecognizer()
    }
    
    func setupGestureRecognizer() {
        self.tv1.addTarget(self, action: #selector(self.tvTap), forControlEvents: .touchDown)
        self.tv2.addTarget(self, action: #selector(self.tvTap), forControlEvents: .touchDown)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let hstack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceAround, alignItems: .center, children: [
            self.tv1,
            self.tv2
        ])
        hstack.style.width = ASDimensionMake("100%")
        let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10), child: hstack)
        return inset
    }
    
    func setupNode() {
        self.backgroundColor = .white
    }
}

extension MainTabBarSelectorNode {
    @objc func tvTap(sender: ASTextNode) {
        print("CLIK")
        if sender.view.tag == 1 {
            delegate?.callbackOnTap(type: MainTabType.onGoing)
        }
        if sender.view.tag == 2 {
            delegate?.callbackOnTap(type: MainTabType.selesai)
        }
    }
}

class ASCustom {
    static func label(value: String? = nil, fontSize: CGFloat? = nil, fontColor: UIColor? = nil, fontWeight: UIFont.Weight? = nil, tag: Int? = nil) -> ASTextNode {
        let ctx = ASTextNode()
        ctx.view.tag = tag ?? 0
        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize ?? 15.0, weight: fontWeight ?? UIFont.Weight.medium),
            .foregroundColor: fontColor ?? UIColor.black
        ]
        let string = NSAttributedString(string: value ?? "", attributes: attrs)
        ctx.attributedText = string
        return ctx
    }
}
