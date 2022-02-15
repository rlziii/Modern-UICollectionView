import UIKit

class OldCollectionViewHeader: UICollectionReusableView {
    // MARK: - Type Properties

    static var reuseIdentifier: String { String(describing: OldCollectionViewHeader.self) }

    // MARK: - Private Properties

    private let label = UILabel(frame: .zero)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    func configure(with text: String) {
        label.text = text
    }

    // MARK: - Private Methods

    private func setupViews() {
        setupLabel()
        setupConstraints()
    }

    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        addSubview(label)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
