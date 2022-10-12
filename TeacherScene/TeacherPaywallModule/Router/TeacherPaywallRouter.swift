//
//  TeacherPaywallRouter.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 10.09.2022.
//

import Foundation
import UIKit

protocol TeacherPaywallRouterInput {
    func showModule(with view: UIViewController)
    
    func showPrivacyPolicyScreen()
    func showTermsOfUseScreen()
    func showBuysubscriptionScreen()
}

final class TeacherPaywallRouter: TeacherPaywallRouterInput {
    func showTermsOfUseScreen() {
        print("реквест темз ов юз пришел в роутер")
    }
    
    func showPrivacyPolicyScreen() {
        print("реквест прайваси полиси пришел в роутер")
    }
    
    func showBuysubscriptionScreen() {
        print("реквест покупки подпишки пришел в роутер")
    }
    
    
    weak var rootViewController: UIViewController?
    
    func showModule(with view: UIViewController) {
        print("router did receive action")
    }
    
    
}
