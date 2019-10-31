//
//  MediumTableCell.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 22/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct MediumTableCell: View {
    @EnvironmentObject var secStore: SectionStore
    @State private var title = ""
    @State private var subtitle = ""
    var sectionID: Int
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeader(title: self.$title, subtitle: self.$subtitle)
            CustonScrollView {
                ForEach(self.secStore.sections.filter { $0.id == self.sectionID }) { section in
                    HStack {
                        VStack {
                            ForEach(section.items.prefix(3)) { item in
                                MediumCell(image: item.image, name: item.name, subheading: item.subheading)
                            }
                        }
                        VStack {
                            ForEach(section.items[3...5]) { item in
                                MediumCell(image: item.image, name: item.name, subheading: item.subheading)
                            }
                        }
                        VStack {
                            ForEach(section.items[5...7]) { item in
                                MediumCell(image: item.image, name: item.name, subheading: item.subheading)
                            }
                        }
                        VStack {
                            ForEach(section.items.suffix(2)) { item in
                                MediumCell(image: item.image, name: item.name, subheading: item.subheading)
                            }
                            Spacer()
                        }
                    }.onAppear {
                        self.title = section.title
                        self.subtitle = section.subtitle
                    }
                }
            }
        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 15))
    }
}


struct MediumCell: View {
    var image: String
    var name: String
    var subheading: String
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(self.image)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(self.name.localizedCapitalized)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(self.subheading)
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button(action: { print(self.name)}) { Image(systemName: "icloud.and.arrow.down")}
            }
        }
    }
}


struct MediumTableCell_Previews: PreviewProvider {
    static var previews: some View {
        MediumTableCell(sectionID: 2).environmentObject(SectionStore())
    }
}
