import UIKit

class CreateTodoItemView: UIView {
    // MARK: - Private Properties

    private let stackView = UIStackView(frame: .zero)
    private let titleTextField = UITextField(frame: .zero)
    private let iconSegmentedControl = UISegmentedControl(frame: .zero)
    private let favoriteStackView = UIStackView(frame: .zero)
    private let favoriteLabel = UILabel(frame: .zero)
    private let favoriteToggle = UISwitch(frame: .zero)
    private let saveButton = UIButton(type: .system)

    private var buttonAction: ((Action) -> Void)?

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

    func setupButtonActions(_ buttonAction: @escaping (Action) -> Void) {
        self.buttonAction = buttonAction
    }

    func makeTitleTextFieldActive() {
        titleTextField.becomeFirstResponder()
    }

    // MARK: - Private Methods

    private func setupSelf() {
        backgroundColor = .systemBackground
    }

    private func setupSubviews() {
        setupStackView()
        setupTitleTextField()
        setupIconSegmentedControl()
        setupFavoriteStackView()
        setupFavoriteLabel()
        setupFavoriteToggle()
        setupSaveButton()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        addSubview(stackView)
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(iconSegmentedControl)
        stackView.addArrangedSubview(favoriteStackView)
        stackView.addArrangedSubview(saveButton)
    }

    private func setupTitleTextField() {
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.placeholder = "Todo Item Title"
        titleTextField.borderStyle = .roundedRect
        titleTextField.addAction(.init(handler: { [unowned self] _ in
            saveButton.isEnabled = !(titleTextField.text?.isEmpty ?? true)
        }), for: .editingChanged)
    }

    private func setupIconSegmentedControl() {
        iconSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        TodoItem.Icon.allCases.forEach {
            let image = UIImage(systemName: $0.rawValue)!
            let index = iconSegmentedControl.numberOfSegments
            iconSegmentedControl.insertSegment(with: image, at: index, animated: false)
        }
        iconSegmentedControl.selectedSegmentIndex = 0
    }

    private func setupFavoriteStackView() {
        favoriteStackView.translatesAutoresizingMaskIntoConstraints = false
        favoriteStackView.alignment = .center
        favoriteStackView.distribution = .fillEqually
        favoriteStackView.spacing = UIStackView.spacingUseSystem
        favoriteStackView.addArrangedSubview(favoriteLabel)
        favoriteStackView.addArrangedSubview(favoriteToggle)
    }

    private func setupFavoriteLabel() {
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.text = "Is Favorite:"
        favoriteLabel.textAlignment = .right
    }

    private func setupFavoriteToggle() {
        favoriteToggle.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupSaveButton() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save Todo Item", for: .normal)
        saveButton.isEnabled = false
        saveButton.addAction(.init(handler: { [weak self] _ in
            if let createTodoInfo = self?.currentCreateTodoInfo() {
                self?.buttonAction?(.saveButtonTapped(createTodoInfo))
            }
        }), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    private func currentCreateTodoInfo() -> CreateTodoItemViewController.CreateTodoInfo {
        let title = titleTextField.text ?? ""
        let iconIndex = max(iconSegmentedControl.selectedSegmentIndex, 0)
        let isFavorite = favoriteToggle.isOn

        return (title: title, iconIndex: iconIndex, isFavorite: isFavorite)
    }
}

// MARK: - Action

extension CreateTodoItemView {
    enum Action {
        case saveButtonTapped(CreateTodoItemViewController.CreateTodoInfo)
    }
}
