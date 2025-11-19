//
//  DelegateFactory.swift
//  MVVMs
//

import UIKit

enum DelegateFactory {
    static func makeModule() -> UIViewController {
        let viewModel = DelegateViewModel()
        let viewController = DelegateViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
