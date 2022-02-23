import UIKit

enum Item: Hashable {
    case todoItem(TodoItem)
    case header(String)
}

class TodoListCollectionViewDataSource {
    // MARK: - Private Properties
    private var favoriteTodoItems = [TodoItem]()
    private var nonFavoriteTodoItems = [TodoItem]()

    private let dataSource: UICollectionViewDiffableDataSource<Section, Item>

    init(with collectionView: UICollectionView) {
        let headerRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { cell, _, title in
            var content = cell.defaultContentConfiguration()
            content.text = title
            cell.contentConfiguration = content
        }

        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, TodoItem> { cell, _, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            content.image = UIImage(systemName: item.icon.rawValue)!
            cell.contentConfiguration = content

            let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
            imageView.tintColor = .systemYellow
            cell.accessories = [.customView(
                configuration: .init(customView: imageView, placement: .trailing(), isHidden: item.isNotFavorite)
            )]
        }

        dataSource = .init(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
            case .header(let header):
                return collectionView.dequeueConfiguredReusableCell(
                    using: headerRegistration,
                    for: indexPath,
                    item: header
                )
            case .todoItem(let todoItem):
                return collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: todoItem
                )
            }
        }
    }

    func addTodoItem(_ todoItem: TodoItem) {
        if todoItem.isFavorite {
            favoriteTodoItems.append(todoItem)
        } else {
            nonFavoriteTodoItems.append(todoItem)
        }

        updateData()
    }

    func updateData(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases)

        let favoritesHeader = favoriteTodoItems.isEmpty ? [] : [Item.header("Favorites")]
        let favorites = favoritesHeader + favoriteTodoItems.map(Item.todoItem)
        snapshot.appendItems(favorites, toSection: .favorites)

        let nonFavorites = [Item.header("Todo Items")] + nonFavoriteTodoItems.map(Item.todoItem)
        snapshot.appendItems(nonFavorites, toSection: .nonFavorites)

        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
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

private extension TodoListCollectionViewDataSource {
    enum Section: Int, CaseIterable {
        case favorites
        case nonFavorites
    }
}
