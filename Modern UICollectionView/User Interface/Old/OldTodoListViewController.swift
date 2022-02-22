import UIKit

class OldTodoListViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var oldTodoListView = OldTodoListView()
    private let dataSource = TodoListTableViewDataSource()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = oldTodoListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Todo List"

        oldTodoListView.setupTableViewDataSource(dataSource)

        navigationItem.rightBarButtonItem = .init(
            systemItem: .add,
            primaryAction: .init(handler: { [unowned self] _ in
                show(CreateTodoItemViewController(onSave: saveTodoItem), sender: self)
            })
        )
    }

    private func saveTodoItem(_ todoItem: TodoItem) {
        dataSource.addTodoItem(todoItem)
        oldTodoListView.reloadTableView()
    }
}
