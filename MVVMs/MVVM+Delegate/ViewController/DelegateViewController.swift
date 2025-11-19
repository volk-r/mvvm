//
//  DelegateViewController.swift
//  MVVMs
//

import UIKit

final class DelegateViewController: UIViewController {
    private let viewModel: DelegateViewModel

    private let label = UILabel()
    private let button = UIButton(type: .system)

    init(viewModel: DelegateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        label.text = viewModel.labelText
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

    @objc private func buttonTapped() {
        viewModel.changeLabelText()
    }
}

extension DelegateViewController: DelegateViewModelDelegate {
    func didChangeLabelText(_ newText: String) {
        label.text = newText
    }
}
