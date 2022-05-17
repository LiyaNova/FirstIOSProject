//
//  StringExtension.swift
//  Navigation
//
//  Created by Юлия Филимонова on 17.05.2022.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*\\d)(?=.*[!?@#])[a-z\\d!?@#]{7,}$").evaluate(with: self)
    }
}
