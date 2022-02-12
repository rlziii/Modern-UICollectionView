import UIKit

class LandingView: UIView {
    // MARK: - Private Properties

    private let stackView = UIStackView(frame: .zero)
    private let oldCollectionViewButton = UIButton(type: .system)
    private let modernCollectionViewButton = UIButton(type: .system)

    private var buttonAction: ((Action) -> Void)?

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

    func setupButtonActions(_ buttonAction: @escaping (Action) -> Void) {
        self.buttonAction = buttonAction
    }

    // MARK: - Private Methods

    private func setupSelf() {
        backgroundColor = .systemBackground
    }

    private func setupSubviews() {
        setupStackView()
        setupOldCollectionViewButton()
        setupModernCollectionViewButton()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.addArrangedSubview(oldCollectionViewButton)
        stackView.addArrangedSubview(modernCollectionViewButton)
    }

    private func setupOldCollectionViewButton() {
        oldCollectionViewButton.translatesAutoresizingMaskIntoConstraints = false
        oldCollectionViewButton.setTitle("Old UICollectionView", for: .normal)
        oldCollectionViewButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonAction?(.oldCollectionViewButtonTapped)
        }), for: .touchUpInside)

    }

    private func setupModernCollectionViewButton() {
        modernCollectionViewButton.translatesAutoresizingMaskIntoConstraints = false
        modernCollectionViewButton.setTitle("Modern UICollectionView", for: .normal)
        modernCollectionViewButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonAction?(.modernCollectionViewButtonTapped)
        }), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

// MARK: - Action

extension LandingView {
    enum Action {
        case oldCollectionViewButtonTapped
        case modernCollectionViewButtonTapped
    }
}
