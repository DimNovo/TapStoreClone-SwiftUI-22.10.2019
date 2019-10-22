//
//  SmallTableCell.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 22/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct SmallTableCell: View {
    @EnvironmentObject var secStore: SectionStore
    @State private var title = ""
    @State private var subtitle = ""
    var sectionID: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeader(title: self.$title, subtitle: self.$subtitle)
            ForEach(self.secStore.sections.filter { $0.id == self.sectionID }, id: \.id) {
                section in
                ForEach(section.items, id: \.id) { item in
                    HStack(spacing: 15) {
                        Image(item.image)
                        .cornerRadius(4)
                        VStack(alignment: .leading) {
                            Text(item.name).font(.system(size: 22)).bold().foregroundColor(.primary)
                        }
                    }
                }.onAppear {
                    self.title = section.title
                    self.subtitle = section.subtitle
                }
            }
        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }
}

struct SmallTableCell_Previews: PreviewProvider {
    static var previews: some View {
        SmallTableCell(sectionID: 4).environmentObject(SectionStore())
    }
}
