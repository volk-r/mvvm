//
//  CallBackViewModel.swift
//  MVVMs
//

import Foundation

final class CallbackViewModel {

    var onLabelTextChanged: ((String) -> Void)?

    private var counter = 0

    func changeLabelText() {
        counter += 1
        let newText = "Нажато раз: \(counter)"
        onLabelTextChanged?(newText)
    }
}
