//
//  StateViewController.swift
//  MVVMs
//

import UIKit
import Combine

final class StateViewController: UIViewController {
    
    private let viewModel: StateViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private let label = UILabel()
    private let button = UIButton(type: .system)
    
    init(viewModel: StateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
	required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        label.textAlignment = .center
        
        button.setTitle("Изменить текст", for: .normal)
        button.configuration = .prominentGlass()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 24),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupBindings() {
        viewModel.statePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.render(state: state)
            }
            .store(in: &cancellables)
    }
    
    private func render(state: AppState) {
        label.text = state.labelText
    }
    
    @objc private func buttonTapped() {
        viewModel.handleButtonTap()
    }
}
// view -> viewmodel -> store -> state -> view

#Preview {
    let store = AppStore()
    let viewModel = StateViewModel(store: store)
    return StateViewController(viewModel: viewModel)
}
