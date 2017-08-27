//
//  ViewFactory.swift
//  AppArchitectureSample
//
//  Created by Yoshikuni Kato on 8/26/17.
//  Copyright © 2017 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol ViewFactory {
    func foo() -> (UIViewController, FooViewModel)
    func bar() -> (UIViewController)
}

final class SampleViewFactory {

    private let components: Components

    init(components: Components) {
        self.components = components
    }
}

extension SampleViewFactory: ViewFactory {
    
    func foo() -> (UIViewController, FooViewModel) {
        let viewController = UIStoryboard(name: "FooViewController", bundle: nil).instantiateInitialViewController() as! FooViewController
        let viewModel = FooViewModel()
        viewController.viewModel = viewModel
        return (viewController, viewModel)
    }
    
    func bar() -> (UIViewController) {
        let viewController = UIStoryboard(name: "BarViewController", bundle: nil).instantiateInitialViewController() as! BarViewController
        return viewController
    }

}
