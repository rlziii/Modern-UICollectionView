import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - UIWindowSceneDelegate Properties

    var window: UIWindow?

    // MARK: - UIWindowSceneDelegate Methods

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("Could not cast \(UIScene.self) to \(UIWindowScene.self).")
        }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: LandingViewController())
        window?.makeKeyAndVisible()
    }
}
