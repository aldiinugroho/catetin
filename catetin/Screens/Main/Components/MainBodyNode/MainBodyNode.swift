//
//  MainBodyNode.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import Foundation
import AsyncDisplayKit

class MainBodyNode: ASDisplayNode {
    var header: ASDisplayNode?
    let pager: MainTabBarNode = MainTabBarNode()
    lazy var btncreate: ASDisplayNode = {
        let ctx = ASDisplayNode()
        ctx.backgroundColor = .orange
        ctx.style.width = ASDimension(unit: .points, value: 50) // Fixed width
        ctx.style.height = ASDimension(unit: .points, value: 50) // Fixed height
        ctx.cornerRadius = 25 
        // Add tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapCreate))
        ctx.view.addGestureRecognizer(tapGesture)
        return ctx
    }()
    let context: ASDKViewController<ASDisplayNode>
    
    init(context: ASDKViewController<ASDisplayNode>) {
        self.context = context
        super.init()
        self.automaticallyManagesSubnodes = true
        setContext()
    }
    
    func setContext() {
        self.header = CHeader(context: context)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [
            self.header ?? ASDisplayNode(),
            self.pager
        ])
        let relative = ASRelativeLayoutSpec(horizontalPosition: .end,
                                            verticalPosition: .end,
                                                sizingOption: [],
                                            child: self.btncreate)
        let btmist = Utilssize.getHeight() * 0.11
        let inset = ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: btmist, right: 10), child: relative)
        let bg = ASBackgroundLayoutSpec(child: inset, background: stack)
        return bg
    }
}

extension MainBodyNode {
    @objc func onTapCreate() {
        print("CREATE CLICK")
        let createScreen: ASDKViewController<ASDisplayNode> = CreatePostingController()
        Routes.push(context: context, to: createScreen)
    }
}
