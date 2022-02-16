import UIKit

class NewViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var newView = NewView()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = newView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // ...
    }
}
