import UIKit

class TableTodoListViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var tableTodoListView = TableTodoListView()
    private let dataSource = TodoListTableViewDataSource()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = tableTodoListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Todo List"

        navigationItem.rightBarButtonItem = .init(
            systemItem: .add,
            primaryAction: .init(handler: { [unowned self] _ in
                show(CreateTodoItemViewController(onSave: saveTodoItem), sender: self)
            })
        )

        tableTodoListView.setupTableViewDataSource(dataSource)
    }

    // MARK: - Private Methods

    private func saveTodoItem(_ todoItem: TodoItem) {
        dataSource.addTodoItem(todoItem)
        tableTodoListView.reloadTableView()
    }
}
