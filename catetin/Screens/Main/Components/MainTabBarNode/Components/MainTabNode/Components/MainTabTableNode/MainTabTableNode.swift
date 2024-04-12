//
//  MainTabTableNode.swift
//  catetin
//
//  Created by aldinugroho on 12/04/24.
//

import Foundation
import AsyncDisplayKit

class MainTabTableNode: ASDisplayNode {
    
    var table: ASTableNode?
    let dataOnProgress: [ModelPosting] = [
        ModelPosting(postingName: "John Elkan", postingTitle: "Minjem buat lebaran", postingValue: 50000000),
        ModelPosting(postingName: "John Lenon", postingTitle: "Minjem buat THR", postingValue: 10000000)
    ]
    let dataSelesai: [ModelPosting] = [
        ModelPosting(postingName: "John Elkan", postingTitle: "Main Saham", postingValue: 10000000),
        ModelPosting(postingName: "John Lenon", postingTitle: "Main BTC", postingValue: 23000000)
    ]
    var maindata: [ModelPosting] = [] {
        didSet {
            guard let table = table else { return }
            table.reloadData()
        }
    }
    
    override init() {
        super.init()
        setup()
        setupTable()
    }
    
    func setTableData(type: MainTabType) {
        if type == MainTabType.onGoing {
            maindata = dataOnProgress
        }
        if type == MainTabType.selesai {
            maindata = dataSelesai
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wrap = ASWrapperLayoutSpec(layoutElement: self.table ?? ASDisplayNode())
        return wrap
    }
    
    func setup() {
        self.automaticallyManagesSubnodes = true
    }
    
    func setupTable() {
        table = ASTableNode()
        table?.dataSource = self
        table?.delegate = self
    }
}

extension MainTabTableNode: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return maindata.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cell = MainTabTableCellNode()
        cell.config(data: ModelPosting(postingName: maindata[indexPath.row].postingName, postingTitle: maindata[indexPath.row].postingTitle, postingValue: maindata[indexPath.row].postingValue))
        return cell
    }
}

class MainTabTableCellNode: ASCellNode {
    lazy var tvCreditur: ASTextNode = {
        let ctx = ASCustom.label(value: "Creditur", fontWeight: UIFont.Weight.bold)
        return ctx
    }()
    
    lazy var tvTitle: ASTextNode = {
        let ctx = ASCustom.label(value: "Title")
        return ctx
    }()
    
    lazy var tvPrice: ASTextNode = {
        let ctx = ASCustom.label(value: "Price")
        return ctx
    }()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    func config(data: ModelPosting) {
        tvCreditur = ASCustom.label(value: data.postingName, fontWeight: UIFont.Weight.bold)
        tvTitle = ASCustom.label(value: data.postingTitle)
        let currency = UtilsFormatCurrency(data.postingValue)
        tvPrice = ASCustom.label(value: "Rp \(currency)")
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [
            self.tvCreditur,
            self.tvTitle,
            self.tvPrice
        ])
        let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), child: stack)
        return inset
    }
}
