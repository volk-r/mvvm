//
//  AppState.swift
//  MVVMs
//

import Foundation

struct AppState {
    var labelText: String
    var counter: Int
    
    static let initial = AppState(
        labelText: "Текст до нажатия",
        counter: 0
    )
}

enum AppAction {
    case buttonTapped
}
