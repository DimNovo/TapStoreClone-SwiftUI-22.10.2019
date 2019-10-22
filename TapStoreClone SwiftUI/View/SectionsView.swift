//
//  SectionsView.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 22/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct SectionsView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                FeaturedCell(sectionID: 1)
                MediumTableCell(sectionID: 2)
                MediumTableCell(sectionID: 3)
                SmallTableCell(sectionID: 4)
                MediumTableCell(sectionID: 5)
                MediumTableCell(sectionID: 6)
                FeaturedCell(sectionID: 7)
            }.navigationBarTitle("Apps")
        }
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView().environmentObject(SectionStore()).colorScheme(.dark)
    }
}
