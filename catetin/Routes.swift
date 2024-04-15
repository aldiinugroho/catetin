//
//  Routes.swift
//  catetin
//
//  Created by aldinugroho on 15/04/24.
//

import Foundation
import AsyncDisplayKit

class Routes {
    static func push(context: ASDKViewController<ASDisplayNode>, to: ASDKViewController<ASDisplayNode>) {
        context.navigationController?.pushViewController(to, animated: false)
    }
    static func pop(context: ASDKViewController<ASDisplayNode>) {
        context.navigationController?.popViewController(animated: false)
    }
}
