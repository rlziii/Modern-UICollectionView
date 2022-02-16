import UIKit

class NewView: UIView {
    // MARK: - Private Properties

    // ...

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)

        setupSelf()
        setupSubviews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    // ...

    // MARK: - Private Properties

    private func setupSelf() {
        backgroundColor = .systemRed
    }

    private func setupSubviews() {
        // ...
    }

    // ...

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ...
        ])
    }
}
