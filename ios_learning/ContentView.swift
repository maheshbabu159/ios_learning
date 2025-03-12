//
//  ContentView.swift
//  ios_learning
//
//  Created by Maheshbabu Somineni on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    var categories = ["Data Structures", "Swift", "SwiftUI", "Interview Questions"]
    var body: some View {
        VStack {
            NavigationStack {
                List(categories, id: \.self){ item in
                    NavigationLink(destination: DetailsView(item: item)) {
                        ListRowView(item: item)
                    }
                }
                .navigationTitle("iOS")
            }
        }
    }
}
struct ListRowView: View {
    var item = "Array item"
    var body: some View {
        HStack{
            Image(systemName: "leaf")
                .imageScale(.large)
            Text(item)
        }
    }
}
    

#Preview {
    ContentView()
}
