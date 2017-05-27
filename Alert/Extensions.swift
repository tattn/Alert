//
//  Extensions.swift
//  Alert
//
//  Created by Tatsuya Tanaka on 20170527.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static func safeMainAsync(execute: @escaping () -> Void) {
        if Thread.isMainThread {
            execute()
        } else {
            DispatchQueue.main.async(execute: execute)
        }
    }
}
