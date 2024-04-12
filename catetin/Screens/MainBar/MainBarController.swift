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
        let view1: ASDKViewController<ASDisplayNode> = MainViewController()
        view1.title = "Home"
        let view2: ASDKViewController<ASDisplayNode> = ASDKViewController()
        view2.view.backgroundColor = .baseGray
        view2.title = "Account"
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.setViewControllers([
            view1,
            view2
        ], animated: false)
    }
}
