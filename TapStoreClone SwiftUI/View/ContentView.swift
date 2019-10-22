//
//  ContentView.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 22/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: self.$selection) {
            
            SectionsView().tabItem {
                VStack {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("Apps")
                }.font(.system(size: 23))
            }.tag(0)
            
            Text("Games").tabItem {
                VStack {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }.font(.system(size: 23))
            }.tag(1)
            
            Text("Arcade").tabItem {
                VStack {
                    Image(systemName: "dollarsign.circle")
                    Text("Arcade")
                }.font(.system(size: 23))
            }.tag(2)
            
            Text("Search").tabItem {
                VStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.font(.system(size: 23))
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SectionStore())
    }
}
