import UIKit

class CreateTodoItemViewController: UIViewController {
    // MARK: - Type aliases

    typealias CreateTodoInfo = (title: String, iconIndex: Int, isFavorite: Bool)

    // MARK: - Private Properties

    private lazy var createTodoItemView = CreateTodoItemView()
    private let onSave: (TodoItem) -> Void

    // MARK: - Initialization

    init(onSave: @escaping (TodoItem) -> Void) {
        self.onSave = onSave
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = createTodoItemView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create Todo Item"

        createTodoItemView.setupButtonActions { [unowned self] action in
            switch action {
            case .saveButtonTapped(let createTodoInfo):
                saveButtonTapped(with: createTodoInfo)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        createTodoItemView.makeTitleTextFieldActive()
    }

    // MARK: - Private Methods

    private func saveButtonTapped(with createTodoInfo: CreateTodoInfo) {
        let title = createTodoInfo.title
        let icon = TodoItem.Icon.allCases[createTodoInfo.iconIndex]
        let isFavorite = createTodoInfo.isFavorite
        let todoItem = TodoItem(title: title, icon: icon, isFavorite: isFavorite)
        onSave(todoItem)
        navigationController?.popViewController(animated: true)
    }
}
