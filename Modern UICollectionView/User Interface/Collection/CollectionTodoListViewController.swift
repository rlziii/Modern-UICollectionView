import UIKit

class CollectionTodoListViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var collectionTodoListView = CollectionTodoListView()

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

        // ...
    }
}
