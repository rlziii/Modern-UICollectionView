import UIKit

class OldCollectionViewCell: UICollectionViewCell {
    // MARK: - Type Properties

    static var reuseIdentifier: String { String(describing: OldCollectionViewCell.self) }

    // MARK: - Private Properties

    private let imageView = UIImageView(image: nil)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    func configure(with image: UIImage) {
        imageView.image = image
    }

    // MARK: - Private Methods

    private func setupViews() {
        setupImageView()
        setupConstraints()
    }

    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
