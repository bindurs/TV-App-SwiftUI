//
//  SerachBar.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {

    @Binding var searchText: String
    var onSearchButtonClicked: ((Bool) -> Void)? = nil

    class Coordinator: NSObject, UISearchBarDelegate {

        var control: SearchBar

        init(_ control: SearchBar) {
            self.control = control
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            control.searchText = searchText
            control.onSearchButtonClicked!(true)
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            control.onSearchButtonClicked!(true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchTextField.placeholder = "Search Series"
        searchBar.searchTextField.font = UIFont(name: "ChalkboardSE-Regular", size: 16) ?? UIFont.systemFont(ofSize: 14)
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.tintColor = .white
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        searchBar.barStyle = .black
        searchBar.delegate = context.coordinator
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = searchText

    }

}

//struct SearchBar: View {
//    @Binding var searchText: String
//    var editingChanged: (Bool)->() = { _ in }
//    @State private var isEditing = false
//
//    var body: some View {
//        HStack {
//            ZStack {
//                CustomTextField(placeholder: Text("Search Series"), text: $searchText, editingChanged: editingChanged)
//                    .foregroundColor(.white)
//                    .padding(5)
//                    .padding(.horizontal, 25)
//                    .background( Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)))
//                    .cornerRadius(8)
//                    .overlay(
//                        HStack {
//                            Image(systemName: "magnifyingglass")
//                                .foregroundColor(.gray)
//                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                                .padding(.leading, 8)
//
//                            if isEditing {
//                                Button(action: {
//                                    self.searchText = ""
//                                }) {
//                                    Image(systemName: "multiply.circle.fill")
//                                        .foregroundColor(.gray)
//                                        .padding(.trailing, 8)
//                                }
//                            }
//                        }
//                    )
//                    .padding(.horizontal, 10)
//                    .onTapGesture {
//                        self.isEditing = true
//                    }
//            }
//
//        }.frame(width: UIScreen.main.bounds.width, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//    }
//}

//struct CustomTextField: View {
//    var placeholder: Text
//    @Binding var text: String
//    var editingChanged: (Bool)->() = { _ in }
//    var commit: ()->() = { }
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            if text.isEmpty { placeholder }
//            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
//            TextField()
//        }
//    }
//}
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
