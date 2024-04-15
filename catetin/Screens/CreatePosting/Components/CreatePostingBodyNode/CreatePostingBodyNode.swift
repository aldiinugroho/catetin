//
//  CreatePostingBodyNode.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit

class CreatePostingBodyNode: ASDisplayNode {
    let context: ASDKViewController<ASDisplayNode>
    var header: CHeader?
    let screentitle: CTitleScreen = CTitleScreen(title: "Buat Data")
    let tfCreditur: CFieldText = CFieldText(tag: "tfCreditur", placeholder: "Creditur")
    let tfKegunaan: CFieldText = CFieldText(tag: "tfKegunaan", placeholder: "Kegunaan")
    let tfJatuhTempo: CFieldText = CFieldText(tag: "tfJatuhTempo", placeholder: "Tanggal Jatuh Tempo (Opsional)")
    
    init(context: ASDKViewController<ASDisplayNode>) {
        self.context = context
        super.init()
        self.automaticallyManagesSubnodes = true
        setContext()
        self.tfCreditur.delegate = self
        self.tfKegunaan.delegate = self
        self.tfJatuhTempo.delegate = self
    }
    
    func setContext() {
        self.header = CHeader(context: context, withBackBtn: true)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [
            self.header ?? ASDisplayNode(),
            self.screentitle,
            ASInsetLayoutSpec(insets: .init(top: 0, left: 10, bottom: 0, right: 10), child: ASStackLayoutSpec(direction: .vertical, spacing: 10, justifyContent: .start, alignItems: .start, children: [
                self.tfCreditur,
                self.tfKegunaan,
                self.tfJatuhTempo
            ]))
        ])
        return stack
    }
}

extension CreatePostingBodyNode: CFieldTextDelegate {
    func callbackOnChange(tag: String, values: String) {
        print("\(tag): \(values)")
    }
}
