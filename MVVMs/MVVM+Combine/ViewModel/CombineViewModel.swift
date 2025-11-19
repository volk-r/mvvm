//
//  CombineViewModel.swift
//  MVVMs
//

import Foundation
import Combine

final class CombineViewModel {
    
    let labelTextSubject = CurrentValueSubject<String, Never>("Текст до нажатия")
    let counterSubject = CurrentValueSubject<Int, Never>(0)
    
    func changeLabelText() {
        let newCounter = counterSubject.value + 1
        counterSubject.send(newCounter)
        labelTextSubject.send("Нажато раз: \(newCounter)")
    }
}
