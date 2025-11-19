//
//  CallBackViewController.swift
//  MVVMs
//

import UIKit

final class CallbackViewController: UIViewController {

    private let viewModel: CallbackViewModel

    private let label = UILabel()
    private let button = UIButton(type: .system)

    init(viewModel: CallbackViewModel) {
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
        label.text = "Текст до нажатия"
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
        viewModel.onLabelTextChanged = { [weak self] newText in
            self?.label.text = newText
        }
    }

    @objc private func buttonTapped() {
        viewModel.changeLabelText()
    }
}

#Preview {
    CallbackViewController(viewModel: CallbackViewModel())
}
