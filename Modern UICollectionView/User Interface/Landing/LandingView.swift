import UIKit

class LandingView: UIView {
    // MARK: - Private Properties

    private let stackView = UIStackView(frame: .zero)
    private let tableViewButton = UIButton(type: .system)
    private let collectionViewButton = UIButton(type: .system)

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
        setupTableViewButton()
        setupCollectionViewButton()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        addSubview(stackView)
        stackView.addArrangedSubview(tableViewButton)
        stackView.addArrangedSubview(collectionViewButton)
    }

    private func setupTableViewButton() {
        tableViewButton.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.borderedProminent()
        configuration.title = "Old-Style UITableView"
        tableViewButton.configuration = configuration
        tableViewButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonAction?(.tableViewButtonTapped)
        }), for: .touchUpInside)

    }

    private func setupCollectionViewButton() {
        collectionViewButton.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.borderedProminent()
        configuration.title = "List-Style UICollectionView"
        collectionViewButton.configuration = configuration
        collectionViewButton.addAction(.init(handler: { [weak self] _ in
            self?.buttonAction?(.collectionViewButtonTapped)
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
        case tableViewButtonTapped
        case collectionViewButtonTapped
    }
}
