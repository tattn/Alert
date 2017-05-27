//
//  Alert.swift
//  Alert
//
//  Created by Tatsuya Tanaka on 20170527.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation
import UIKit

public protocol AlertProtocol {
    var alertController: UIAlertController { get }

    var title: String? { get set }
    var message: String? { get set }

    var actions: [UIAlertAction] { get }

    init(title: String?,
         message: String?)

    @discardableResult
    func addAction(_ title: String,
                   style: UIAlertActionStyle,
                   handler: ((Self, UIAlertAction) -> Void)?) -> Self

    func present(on parentViewController: UIViewController?,
                 animated: Bool,
                 completion: (() -> Void)?)
}

public extension AlertProtocol {
    public var title: String? {
        get { return alertController.title }
        set { alertController.title = newValue }
    }

    public var message: String? {
        get { return alertController.message }
        set { alertController.message = newValue }
    }

    public var actions: [UIAlertAction] {
        return alertController.actions
    }

    @discardableResult
    public func addAction(_ title: String,
                          style: UIAlertActionStyle = .default,
                          handler: ((Self, UIAlertAction) -> Void)? = nil) -> Self {
        let action = UIAlertAction(title: title, style: style) { action in
            handler?(self, action)
        }
        alertController.addAction(action)
        return self
    }
}

extension AlertProtocol {
    func viewControllerToPresent(_ viewController: UIViewController?) -> UIViewController? {
        if let vc = viewController {
            return vc
        } else if var vc = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = vc.presentedViewController {
                vc = presentedViewController
            }
            return vc
        } else {
            return nil
        }
    }

    func presentOnMainThread(_ viewControllerToPresent: UIViewController?,
                        animated: Bool,
                        completion: (() -> Void)?) {
        guard let vc = self.viewControllerToPresent(viewControllerToPresent) else {
            completion?()
            return
        }

        DispatchQueue.safeMainAsync {
            vc.present(self.alertController, animated: animated, completion: completion)
        }
    }
}
