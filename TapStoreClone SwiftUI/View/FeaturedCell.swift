//
//  FeaturedCell.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 22/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct FeaturedCell: View {
    @EnvironmentObject var secStore: SectionStore
    var sectionID: Int
    var body: some View {
        VStack {
            Divider()
                .background(Color.primary)
            .padding(10)
            CustonScrollView {
                HStack(alignment: .center) {
                    ForEach(self.secStore.sections.filter { $0.id == self.sectionID }) {
                        section in
                        ForEach(section.items, id: \.id) { item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.tagline.localizedUppercase)
                                    .font(.system(size: 13))
                                .bold()
                                    .foregroundColor(Color.init(.systemBlue))
                                Text(item.name.localizedCapitalized)
                                    .font(.system(size: 24))
                                .bold()
                                    .foregroundColor(Color.init(.label))
                                Text(item.subheading)
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.init(.secondaryLabel))
                                Image(item.image)
                                    .cornerRadius(10)
                            }
                        }
                    }.padding(.horizontal, 5)
                }
            }
        }
    }
}

struct FeaturedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCell(sectionID: 1).environmentObject(SectionStore())
    }
}
