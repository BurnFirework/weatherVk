//
//  ExtenshionAlert.swift
//  weatherVk
//
//  Created by Арина Соколова on 03.05.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showError(message: String) {
        // Создаем контроллер
        let alertVc = UIAlertController(title: "Error",
                                        message: message,
                                        preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // Добавляем кнопку на UIAlertController
        alertVc.addAction(okAction)
        
        // Показываем UIAlertController
        present(alertVc, animated: true, completion: nil)
    }
}
