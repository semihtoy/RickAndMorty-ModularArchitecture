//
//  UIStoryboardExtensions.swift
//  RMScenes
//
//  Created by SemihTOY on 6.09.2023.
//

import UIKit

public extension UIStoryboard {

  class func instantiateViewController<T: UIViewController>(_ storyboardName: Storyboards, _: T.Type) -> T? {
    return UIStoryboard(name: storyboardName.rawValue, bundle: RMScenesBundle.bundle).instantiateViewController(withIdentifier: String(describing: T.self)) as? T
  }

  class func instantiateViewController<T: UIViewController>(_ storyboardName: String, clazz: AnyClass) -> T? {
    return UIStoryboard(name: storyboardName, bundle: RMScenesBundle.bundle).instantiateViewController(withIdentifier: String(describing: clazz)) as? T
  }

  class func instantiateViewController<T: UIViewController>(_ storyboardName: String, identifier: String) -> T? {
    return UIStoryboard(name: storyboardName, bundle: RMScenesBundle.bundle).instantiateViewController(withIdentifier: identifier) as? T
  }
}
