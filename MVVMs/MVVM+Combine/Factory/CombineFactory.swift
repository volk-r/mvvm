//
//  CombineFactory.swift
//  MVVMs
//

import UIKit

final class CombineFactory {
    static func create() -> UIViewController {
        let viewModel = CombineViewModel()
        let viewController = CombineViewController(viewModel: viewModel)
        return viewController
    }
}
