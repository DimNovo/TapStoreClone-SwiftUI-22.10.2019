//
//  Model.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 22/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct Section: Decodable, Identifiable {
    let id: Int
    let type, title, subtitle: String
    let items: [App]
}

struct App: Decodable, Identifiable {
    let id: Int
    let tagline, name, subheading, image: String
    let iap: Bool
}
