//
//  User.swift
//  ProductsApp
//
//  Created by Agakerim Hemidzade on 26.07.26.
//

import UIKit

enum Theme {
    case light
    case dark
}

struct User {
    let name: String
    let email: String
    let avatarColor: UIColor
    let theme: Theme
}

enum AvatarColor {
    case blue
    case green
    case orange
}
