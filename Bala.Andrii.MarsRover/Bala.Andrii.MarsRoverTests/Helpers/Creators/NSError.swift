//
//  NSError.swift
//  Bala.Andrii.MarsRoverTests
//
//  Created by Andrii Bala on 12/25/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation

extension NSError {
    static func createError(withMessage message: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
