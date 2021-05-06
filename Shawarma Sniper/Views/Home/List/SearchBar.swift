//
//  SearchBar.swift
//  Shawarma Sniper
//
//  Created by Uthman Mohamed on 2021-05-06.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State var isEditing = false
    
    var body: some View {
        HStack {
            
            TextField("Search...", text: $text)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding(9)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .transition(.move(edge: .trailing))
                .animation(.default)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        if isEditing && !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    })
                .padding(.trailing, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing && !text.contains("\n") {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                .onDisappear { print("text is \(text)") }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
