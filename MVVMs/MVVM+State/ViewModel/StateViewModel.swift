//
//  StateViewModel.swift
//  MVVMs
//

import Foundation
import Combine

final class StateViewModel {
    
    private let store: AppStore
    
    var statePublisher: AnyPublisher<AppState, Never> {
        store.statePublisher
    }
    
    init(store: AppStore) {
        self.store = store
    }
    
    func handleButtonTap() {
        store.dispatch(.buttonTapped)
    }
}
