import UIKit

class TodoListCollectionViewDiffableDataSource: UICollectionViewDiffableDataSource<Section, Item> {
    // MARK: - Private Type Aliases

    private typealias CellRegistration<I> = UICollectionView.CellRegistration<UICollectionViewListCell, I>

    // MARK: - Private Properties

    private var favoriteTodoItems = [TodoItem]()
    private var nonFavoriteTodoItems = [TodoItem]()

    private var hasFavorites: Bool { !favoriteTodoItems.isEmpty }

    // MARK: - Initialization

    init(collectionView: UICollectionView) {
        let headerRegistration = CellRegistration<String> { cell, _, title in
            var content = cell.defaultContentConfiguration()
            content.text = title
            cell.contentConfiguration = content
        }

        let cellRegistration = CellRegistration<TodoItem> { cell, _, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            content.image = UIImage(systemName: item.icon.rawValue)
            cell.contentConfiguration = content

            let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
            imageView.tintColor = .systemYellow
            cell.accessories = [.customView(
                configuration: .init(customView: imageView, placement: .trailing(), isHidden: item.isNotFavorite)
            )]
        }

        let cellProvider: CellProvider = { collectionView, indexPath, item in
            switch item {
            case .header(let header):
                return collectionView.dequeueConfiguredReusableCell(
                    using: headerRegistration,
                    for: indexPath,
                    item: header
                )
            case .row(let todoItem):
                return collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: todoItem
                )
            }
        }

        super.init(collectionView: collectionView, cellProvider: cellProvider)
    }

    // MARK: - Public Methods

    func updateData(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases)

        let favoritesHeader = hasFavorites ? [Item.header("Favorites")] : []
        let favorites = favoritesHeader + favoriteTodoItems.map(Item.row)
        snapshot.appendItems(favorites, toSection: .favorites)

        let nonFavorites = [Item.header("Todo Items")] + nonFavoriteTodoItems.map(Item.row)
        snapshot.appendItems(nonFavorites, toSection: .nonFavorites)

        apply(snapshot, animatingDifferences: animatingDifferences)
    }

    func addTodoItem(_ todoItem: TodoItem) {
        if todoItem.isFavorite {
            favoriteTodoItems.append(todoItem)
        } else {
            nonFavoriteTodoItems.append(todoItem)
        }

        updateData()
    }

    func deleteTodoItem(at indexPath: IndexPath) {
        let section = Section(rawValue: indexPath.section)

        switch section {
        case .favorites:
            // Subtract one to accommodate header.
            favoriteTodoItems.remove(at: indexPath.item - 1)
        case .nonFavorites:
            // Subtract one to accommodate header.
            nonFavoriteTodoItems.remove(at: indexPath.item - 1)
        case .none:
            break // Do nothing.
        }

        updateData()
    }
}

enum Section: Int, CaseIterable {
    case favorites
    case nonFavorites
}

enum Item: Hashable {
    case header(String)
    case row(TodoItem)
}
