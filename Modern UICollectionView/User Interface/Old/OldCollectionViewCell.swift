import UIKit

class OldCollectionViewCell: UICollectionViewCell {
    // MARK: - Type Properties

    static var reuseIdentifier: String { String(describing: OldCollectionViewCell.self) }

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
        contentView.addSubview(label)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
