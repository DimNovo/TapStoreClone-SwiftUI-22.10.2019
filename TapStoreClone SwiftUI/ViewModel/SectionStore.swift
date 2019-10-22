//
//  SectionStore.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 22/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class SectionStore: ObservableObject {
    
    @Published var sections: [Section] = []
    
    init() {
        self.getAllSections()
    }
    
    private func getAllSections() {
        DispatchQueue.main.async {
            self.sections = Bundle.main.decode([Section].self, from: "appstore.json")
        }
    }
}
