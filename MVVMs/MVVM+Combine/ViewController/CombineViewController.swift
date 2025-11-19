//
//  CombineViewController.swift
//  MVVMs
//

import UIKit
import Combine

final class CombineViewController: UIViewController {
    
    private let viewModel: CombineViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private let label = UILabel()
    private let button = UIButton(type: .system)
    
    init(viewModel: CombineViewModel) {
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
        viewModel.labelTextSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newText in
                self?.label.text = newText
            }
            .store(in: &cancellables)
    }
    
    @objc private func buttonTapped() {
        viewModel.changeLabelText()
    }
}

#Preview {
    CombineViewController(viewModel: CombineViewModel())
}
