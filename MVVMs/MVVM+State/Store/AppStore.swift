//
//  AppStore.swift
//  MVVMs
//

import Foundation
import Combine

final class AppStore {
    
    private let stateSubject: CurrentValueSubject<AppState, Never>
    
    var statePublisher: AnyPublisher<AppState, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    
    var currentState: AppState {
        stateSubject.value
    }
    
    init(initialState: AppState = .initial) {
        self.stateSubject = CurrentValueSubject(initialState)
    }
    
    func dispatch(_ action: AppAction) {
        var state = currentState
        AppReducer.reduce(state: &state, action: action)
        stateSubject.send(state)
    }
}
