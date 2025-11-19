//
//  SceneDelegate.swift
//  MVVMs
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let tabBarController = UITabBarController()

        // Первый таб — MVVM+Delegate модуль
        let delegateVC = DelegateFactory.makeModule()
        delegateVC.tabBarItem = UITabBarItem(title: "Delegate", image: UIImage(systemName: "person.2"), tag: 0)

        // Второй таб — MVVM+callback модуль
        let callbackVC = CallbackModuleFactory.makeModule()
        callbackVC.tabBarItem = UITabBarItem(title: "Callback", image: UIImage(systemName: "bolt.horizontal"), tag: 1)
        
        // Третий таб — MVVM+Combine модуль
        let combineVC = CombineFactory.create()
        combineVC.tabBarItem = UITabBarItem(title: "Combine", image: UIImage(systemName: "arrow.triangle.merge"), tag: 2)
        
        // Четвёртый таб — MVVM+State модуль
        let stateVC = StateFactory.create()
        stateVC.tabBarItem = UITabBarItem(title: "State", image: UIImage(systemName: "arrow.triangle.branch"), tag: 3)

        tabBarController.viewControllers = [delegateVC, callbackVC, combineVC, stateVC]

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}

}
