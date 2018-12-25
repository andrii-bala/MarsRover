//
//  ViewRouter.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import UIKit

protocol ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
