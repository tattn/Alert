//
//  ActionSheet.swift
//  Alert
//
//  Created by Tatsuya Tanaka on 20170527.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation

public struct ActionSheet: AlertProtocol {
    public internal(set) var alertController: UIAlertController

    public init(title: String? = nil,
                message: String? = nil) {

        alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .actionSheet)
    }

    public func barButtonItem(_ item: UIBarButtonItem) -> ActionSheet {
        alertController.popoverPresentationController?.barButtonItem = item
        return self
    }

    public func presentingSource(_ view: UIView, rect: CGRect? = nil) -> ActionSheet {
        alertController.popoverPresentationController?.sourceView = view
        alertController.popoverPresentationController?.sourceRect = rect ?? view.bounds
        return self
    }

    public func present(on parentViewController: UIViewController? = nil,
                        animated: Bool = true,
                        completion: (() -> Void)? = nil) {

        let popover = alertController.popoverPresentationController
        if popover?.sourceView == nil,
            popover?.sourceRect == nil,
            popover?.barButtonItem == nil {

            popover?.sourceView = parentViewController?.view
            popover?.sourceRect = parentViewController?.view?.bounds ?? .zero
        }

        presentOnMainThread(parentViewController,
                            animated: animated,
                            completion: completion)
    }
}
