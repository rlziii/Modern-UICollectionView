import UIKit

class TodoListTableViewDataSource: NSObject, UITableViewDataSource {
    // MARK: - Private Properties
    private var todoItems = [TodoItem]()
    private var nonFavoriteTodoItems: [TodoItem] { todoItems.filter(\.isNotFavorite) }
    private var favoriteTodoItems: [TodoItem] { todoItems.filter(\.isFavorite) }

    private var hasFavorites: Bool { !favoriteTodoItems.isEmpty }

    // MARK: - Public Methods

    func addTodoItem(_ todoItem: TodoItem) {
        todoItems.append(todoItem)
    }

    // MARK: - UITableViewDataSource Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        hasFavorites ? 2 : 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoItems(for: section).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TodoItemTableViewCell.reuseIdentifier,
            for: indexPath
        )

        if let cell = cell as? TodoItemTableViewCell {
            let todoItem = todoItem(for: indexPath)
            let title = todoItem.title
            let image = UIImage(systemName: todoItem.icon.rawValue)!
            let isFavorite = todoItem.isFavorite
            cell.configure(title: title, image: image, isFavorite: isFavorite)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if hasFavorites {
            switch section {
            case 0:
                return "Favorites"
            case 1:
                return "Todo Items"
            case _:
                invalidSection(section)
            }
        } else {
            switch section {
            case 0:
                return "Todo Items"
            case _:
                invalidSection(section)
            }
        }
    }

    // MARK: Private Methods

    private func todoItems(for section: Int) -> [TodoItem] {
        if hasFavorites {
            switch section {
            case 0:
                return favoriteTodoItems
            case 1:
                return nonFavoriteTodoItems
            case _:
                invalidSection(section)
            }
        } else {
            switch section {
            case 0:
                return nonFavoriteTodoItems
            case _:
                invalidSection(section)
            }
        }
    }

    private func todoItem(for indexPath: IndexPath) -> TodoItem {
        todoItems(for: indexPath.section)[indexPath.row]
    }

    private func invalidSection(_ section: Int) -> Never {
        preconditionFailure("Invalid section: \(section).")
    }
}
