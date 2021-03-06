import UIKit

class TodoItemTableViewCell: UITableViewCell {
    // MARK: - Type Properties

    static var reuseIdentifier: String { String(describing: TodoItemTableViewCell.self) }

    // MARK: - Private Properties

    private let leadingImageView = UIImageView(image: nil)
    private let centerLabel = UILabel(frame: .zero)
    private let trailingImageView = UIImageView(image: UIImage(systemName: "star.fill"))

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    func configure(title: String, image: UIImage, isFavorite: Bool) {
        centerLabel.text = title
        leadingImageView.image = image
        trailingImageView.isHidden = !isFavorite
    }

    // MARK: - Private Methods

    private func setupViews() {
        setupLeadingImageView()
        setupCenterLabel()
        setupTrailingImageView()
        setupConstraints()
    }

    private func setupLeadingImageView() {
        leadingImageView.translatesAutoresizingMaskIntoConstraints = false
        leadingImageView.contentMode = .scaleAspectFit
        contentView.addSubview(leadingImageView)
    }

    private func setupCenterLabel() {
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(centerLabel)
    }

    private func setupTrailingImageView() {
        trailingImageView.translatesAutoresizingMaskIntoConstraints = false
        trailingImageView.contentMode = .scaleAspectFit
        trailingImageView.tintColor = .systemYellow
        contentView.addSubview(trailingImageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            leadingImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            leadingImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            leadingImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            leadingImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            leadingImageView.widthAnchor.constraint(equalTo: leadingImageView.heightAnchor),

            centerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            centerLabel.leadingAnchor.constraint(equalTo: leadingImageView.trailingAnchor, constant: 8),

            trailingImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingImageView.leadingAnchor.constraint(equalTo: centerLabel.trailingAnchor, constant: 8),
            trailingImageView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
