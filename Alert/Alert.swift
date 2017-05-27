//
//  Alert.swift
//  Alert
//
//  Created by Tatsuya Tanaka on 20170527.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation

public final class Alert: AlertProtocol {
    public internal(set) var alertController: UIAlertController

    private init() { fatalError() }

    public init(title: String? = nil,
                message: String? = nil) {

        alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
    }

    public func present(on parentViewController: UIViewController? = nil,
                        animated: Bool = true,
                        completion: (() -> Void)? = nil) {

        presentOnMainThread(parentViewController,
                            animated: animated,
                            completion: completion)
    }
}
