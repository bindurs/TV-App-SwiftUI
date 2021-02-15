//
//  SwiftUIPAgeView.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 23/02/21.
//

import SwiftUI

struct SwiftUIPageView: View {
    
    @State private var selection = "0"
    @State var items: [String] = ["0", "1", "2", "3"]
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                    .tag(item)
            }
        }.tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .onChange(of: selection, perform: { value in
//            if Int(value) == (self.items.count - 1) {
//                self.items.append("\(self.items.count)")
//            }
        })
        .id(items)
    }
}

struct SwiftUIPAgeView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPageView()
    }
}
