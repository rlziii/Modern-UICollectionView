import UIKit

class CollectionTodoListView: UIView {
    // MARK: - Private Properties

    private lazy var collectionViewLayout: UICollectionViewLayout = {
        UICollectionViewCompositionalLayout { [unowned self] section, layoutEnvironment in
            var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            config.headerMode = .firstItemInSection

            config.trailingSwipeActionsConfigurationProvider = { indexPath in
                let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
                    deleteAction?(indexPath)
                    completion(true)
                }
                return UISwipeActionsConfiguration(actions: [delete])
            }

            return NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
        }
    }()

    private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

    private var deleteAction: ((IndexPath) -> Void)?

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

    func configureDeleteAction(_ action: @escaping (IndexPath) -> Void) {
        self.deleteAction = action
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
        collectionView.allowsSelection = false
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
