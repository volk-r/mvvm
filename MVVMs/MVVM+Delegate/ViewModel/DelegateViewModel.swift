//
//  DelegateViewModel.swift
//  MVVMs
//

import Foundation

protocol DelegateViewModelDelegate: AnyObject {
    func didChangeLabelText(_ newText: String)
}

final class DelegateViewModel {
    weak var delegate: DelegateViewModelDelegate?

    private(set) var labelText = "Текст до нажатия"
    private(set) var counter = 0

    func changeLabelText() {
        counter += 1
        labelText = "Нажато раз: \(counter)"
        delegate?.didChangeLabelText(labelText)
    }
}
