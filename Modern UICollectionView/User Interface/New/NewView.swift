import UIKit

class NewView: UIView {
    // MARK: - Private Properties

    private lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(0.2),
            heightDimension: .fractionalWidth(1.0)
        ))
        let group = NSCollectionLayoutGroup(layoutSize: .init(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.2)
        ))
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

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
        backgroundColor = .systemBackground
    }

    private func setupSubviews() {
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
