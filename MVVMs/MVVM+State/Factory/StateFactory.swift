//
//  StateFactory.swift
//  MVVMs
//

import UIKit

final class StateFactory {
    static func create() -> UIViewController {
        let store = AppStore()
        let viewModel = StateViewModel(store: store)
        let viewController = StateViewController(viewModel: viewModel)
        return viewController
    }
}
