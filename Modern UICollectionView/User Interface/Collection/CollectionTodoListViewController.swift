import UIKit

class CollectionTodoListViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var collectionTodoListView = CollectionTodoListView()
    private lazy var dataSource = TodoListCollectionViewDiffableDataSource(
        collectionView: collectionTodoListView.collectionView
    )

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = collectionTodoListView
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

        collectionTodoListView.setupDeleteAction(dataSource.deleteTodoItem(at:))

        // Seed section data.
        dataSource.updateData(animatingDifferences: false)
    }

    // MARK: - Private Methods

    private func saveTodoItem(_ todoItem: TodoItem) {
        dataSource.addTodoItem(todoItem)
    }
}
