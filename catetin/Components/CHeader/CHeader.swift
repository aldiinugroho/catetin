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
    
    let backbtn: ASTextNode = ASCustom.label(value: "Kembali")
    let context: ASDKViewController<ASDisplayNode>
    var withBackBtn: Bool?
    
    init(context: ASDKViewController<ASDisplayNode>, withBackBtn: Bool = false) {
        self.context = context
        self.withBackBtn = withBackBtn
        super.init()
        self.backgroundColor = .baseYellow
        self.automaticallyManagesSubnodes = true
        registerListener()
    }
    
    func registerListener() {
        self.backbtn.addTarget(self, action: #selector(onClickBackBtn), forControlEvents: .touchDown)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [
            self.withBackBtn == false ? ASDisplayNode() : self.backbtn
        ])
        stack.style.width = ASDimensionMake("100%")
        let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: Utilssafearea.top() + 10, left: 10, bottom: 10, right: 10), child: stack)
        return inset
    }
}

extension CHeader {
    @objc func onClickBackBtn() {
        print("BACK BUTTON")
        Routes.pop(context: context)
    }
}
