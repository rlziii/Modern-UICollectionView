import UIKit

class OldViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var oldView = OldView()
    private let dataSource = OldCollectionViewDataSource()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - UIViewController Methods

    override func loadView() {
        view = oldView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        oldView.setupCollectionViewDataSource(dataSource)
    }
}
