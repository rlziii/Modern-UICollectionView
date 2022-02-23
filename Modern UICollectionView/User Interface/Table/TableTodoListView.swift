import UIKit

class TableTodoListView: UIView {
    // MARK: - Private Properties

    private lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)

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

    func setupTableViewDataSource(_ dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }

    func reloadTableView() {
        tableView.reloadData()
    }

    // MARK: - Private Properties

    private func setupSelf() {
        backgroundColor = .systemBackground
    }

    private func setupSubviews() {
        setupTableView()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.register(
            TodoItemTableViewCell.self,
            forCellReuseIdentifier: TodoItemTableViewCell.reuseIdentifier
        )

        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 44

        addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
