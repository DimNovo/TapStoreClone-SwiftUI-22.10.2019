//
//  SectionHeader.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 22/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct SectionHeader: View {
    @Binding var title: String
    @Binding var subtitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Divider()
                .background(Color.primary)
            .padding(10)
            Text(title)
                .font(.system(size: 24))
            .bold()
                .foregroundColor(Color.init(.label))
            Text(subtitle)
                .foregroundColor(.secondary)
        }
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(title: .constant("See it in Dark Mode"), subtitle: .constant("These apps are easy on the eyes"))
    }
}
