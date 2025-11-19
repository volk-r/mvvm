//
//  CallBackFactory.swift
//  MVVMs
//

import UIKit

enum CallbackModuleFactory {
    static func makeModule() -> UIViewController {
        let viewModel = CallbackViewModel()
        let viewController = CallbackViewController(viewModel: viewModel)
        return viewController
    }
}
