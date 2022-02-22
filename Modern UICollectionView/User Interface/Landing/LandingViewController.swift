import UIKit

class LandingViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var landingView = LandingView()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = landingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        landingView.setupButtonActions { [unowned self] action in
            switch action {
            case .tableViewButtonTapped:
                tableViewButtonTapped()
            case .collectionViewButtonTapped:
                collectionViewButtonTapped()
            }
        }
    }

    // MARK: - Private Methods

    private func tableViewButtonTapped() {
        show(OldTodoListViewController(), sender: self)
    }

    private func collectionViewButtonTapped() {
        show(NewViewController(), sender: self)
    }
}
