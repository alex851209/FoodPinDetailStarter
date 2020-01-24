//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by shuo on 2019/12/13.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit


extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
