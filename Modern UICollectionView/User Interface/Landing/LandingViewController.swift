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
            case .oldCollectionViewButtonTapped:
                oldCollectionViewButtonTapped()
            case .modernCollectionViewButtonTapped:
                modernCollectionViewButtonTapped()
            }
        }
    }

    // MARK: - Private Methods

    private func oldCollectionViewButtonTapped() {
        show(OldViewController(), sender: self)
    }

    private func modernCollectionViewButtonTapped() {
        show(NewViewController(), sender: self)
    }
}
