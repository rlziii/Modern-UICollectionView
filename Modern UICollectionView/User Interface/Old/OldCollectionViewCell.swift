import UIKit

class OldTableViewCell: UITableViewCell {
    // MARK: - Type Properties

    static var reuseIdentifier: String { String(describing: OldTableViewCell.self) }

    // MARK: - Private Properties

    private let leadingImageView = UIImageView(image: nil)
    private let trailingLabel = UILabel(frame: .zero)

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Public Methods

    func configure(name: String, image: UIImage) {
        trailingLabel.text = name
        leadingImageView.image = image
    }

    // MARK: - Private Methods

    private func setupViews() {
        setupLeadingImageView()
        setupTrailingLabel()
        setupConstraints()
    }

    private func setupLeadingImageView() {
        leadingImageView.translatesAutoresizingMaskIntoConstraints = false
        leadingImageView.contentMode = .scaleAspectFit
        contentView.addSubview(leadingImageView)
    }

    private func setupTrailingLabel() {
        trailingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(trailingLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            leadingImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            leadingImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            leadingImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            leadingImageView.widthAnchor.constraint(equalToConstant: 44),
            leadingImageView.heightAnchor.constraint(equalToConstant: 44),

            trailingLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            trailingLabel.leadingAnchor.constraint(equalTo: leadingImageView.trailingAnchor, constant: 16),
            trailingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            trailingLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
