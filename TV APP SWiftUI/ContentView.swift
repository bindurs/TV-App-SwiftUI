//
//  ContentView.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchQuery: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)).ignoresSafeArea()
            VStack (spacing: 10) {
                NavTitle()
                ZStack {
                SearchBar(searchText: $searchQuery)
                    .background(Color(.lightGray))
                }
                    .padding(.top, -30)
                List {
                    TestRow(text: .constant("1"))
                    TestRow(text: .constant("2"))
                    TestRow(text: .constant("3"))
                    TestRow(text: .constant("4"))
                    TestRow(text: .constant("5"))
                }
            }
        }
    }
}
struct NavTitle: View {
    var body: some View {
        HStack {
            Text("SHOWS").foregroundColor(.white)
        }.frame(width: UIScreen.main.bounds.size.width, height: 65, alignment: .top).font(.custom("ChalkboardSE-Regular", size: 25))
    }
}

struct TestRow: View {
    @Binding var text: String
    var body: some View {
        Text("text \(text)")
        .listRowBackground(Color.green)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
