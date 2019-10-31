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
            GeometryReader { geometryProxy in
                ScrollView(.vertical, showsIndicators: true) {
                    Group {
                        FeaturedCell(sectionID: 1)
                            .modifier(ProxyModifier(proxyW: 0.99, proxyH: 1.75, proxy: geometryProxy))
                        MediumTableCell(sectionID: 2)
                            .modifier(ProxyModifier(proxyH: 2.25, proxy: geometryProxy))
                        MediumTableCell(sectionID: 3)
                        .modifier(ProxyModifier(proxyH: 2.4, proxy: geometryProxy))
                        SmallTableCell(sectionID: 4)
                        MediumTableCell(sectionID: 5)
                        .modifier(ProxyModifier(proxyH: 2.4, proxy: geometryProxy))
                        MediumTableCell(sectionID: 6)
                        .modifier(ProxyModifier(proxyH: 2.4, proxy: geometryProxy))
                        FeaturedCell(sectionID: 7)
                        .modifier(ProxyModifier(proxyW: 0.99, proxyH: 1.75, proxy: geometryProxy))
                    }
                }.navigationBarTitle("Apps")
            }
        }
    }
}

struct ProxyModifier: ViewModifier {
    var proxyW: CGFloat?
    var proxyH: CGFloat
    var proxy: GeometryProxy
    func body(content: Content) -> some View {
        return content
            .frame(width: self.proxy.size.width / (self.proxyW ?? 1.0), height: self.proxy.size.height / self.proxyH)
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView().environmentObject(SectionStore()).colorScheme(.dark)
    }
}
