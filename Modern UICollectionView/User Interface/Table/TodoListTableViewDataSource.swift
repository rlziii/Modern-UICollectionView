import UIKit

class TodoListTableViewDataSource: NSObject, UITableViewDataSource {
    // MARK: - Private Properties
    private var favoriteTodoItems = [TodoItem]()
    private var nonFavoriteTodoItems = [TodoItem]()

    private var hasFavorites: Bool { !favoriteTodoItems.isEmpty }

    // MARK: - Public Methods

    func addTodoItem(_ todoItem: TodoItem) {
        if todoItem.isFavorite {
            favoriteTodoItems.append(todoItem)
        } else {
            nonFavoriteTodoItems.append(todoItem)
        }
    }

    // MARK: - UITableViewDataSource Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return favoriteTodoItems.count
        case 1:
            return nonFavoriteTodoItems.count
        case _:
            invalidSection(section)
        }
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
        switch section {
        case 0:
            return favoriteTodoItems.isEmpty ? nil : "Favorites"
        case 1:
            return "Todo Items"
        case _:
            invalidSection(section)
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            deleteTodoItem(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .insert, .none:
            break // Not supported.
        @unknown default:
            break // Not supported.
        }
    }

    // MARK: Private Methods

    private func todoItem(for indexPath: IndexPath) -> TodoItem {
        switch indexPath.section {
        case 0:
            return favoriteTodoItems[indexPath.row]
        case 1:
            return nonFavoriteTodoItems[indexPath.row]
        case _:
            invalidSection(indexPath.section)
        }
    }

    private func deleteTodoItem(at indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            favoriteTodoItems.remove(at: indexPath.row)
        case 1:
            nonFavoriteTodoItems.remove(at: indexPath.row)
        case _:
            invalidSection(indexPath.section)
        }
    }

    private func invalidSection(_ section: Int) -> Never {
        preconditionFailure("Invalid section: \(section).")
    }
}
