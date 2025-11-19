//
//  AppReducer.swift
//  MVVMs
//

import Foundation

struct AppReducer {
    static func reduce(state: inout AppState, action: AppAction) {
        switch action {
        case .buttonTapped:
            state.counter += 1
            state.labelText = "Нажато раз: \(state.counter)"
        }
    }
}
