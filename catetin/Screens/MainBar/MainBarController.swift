//
//  MainBarController.swift
//  catetin
//
//  Created by aldinugroho on 12/04/24.
//

import Foundation
import AsyncDisplayKit

class MainBarController: ASTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let view1: ASDKViewController<ASDisplayNode> = setupBar(view: MainViewController(), title: "Home")
        let view2: ASDKViewController<ASDisplayNode> = setupBar(view: ASDKViewController(), title: "Account")
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.setViewControllers([
            view1,
            view2
        ], animated: false)
    }
    
    func setupBar(view: ASDKViewController<ASDisplayNode>, title: String? = "") -> ASDKViewController<ASDisplayNode> {
        view.title = title
        return view
    }
}
