import UIKit

class OldView: UIView {
    // MARK: - Private Properties

    private lazy var collectionViewLayout = UICollectionViewFlowLayout()
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

    func setupCollectionViewDataSource(_ dataSource: UICollectionViewDataSource) {
        collectionView.dataSource = dataSource
    }

    // MARK: - UIView Methods

    override func layoutSubviews() {
        super.layoutSubviews()

        collectionViewLayout.headerReferenceSize = CGSize(width: bounds.width, height: 44)
    }

    // MARK: - Private Properties

    private func setupSelf() {
        backgroundColor = .systemBackground
    }

    private func setupSubviews() {
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.register(
            OldCollectionViewCell.self,
            forCellWithReuseIdentifier: OldCollectionViewCell.reuseIdentifier
        )

        collectionView.register(
            OldCollectionViewHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: OldCollectionViewHeader.reuseIdentifier
        )

        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.minimumInteritemSpacing = 20

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
