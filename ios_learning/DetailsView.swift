//
//  DetailsView.swift
//  ios_learning
//
//  Created by Maheshbabu Somineni on 3/12/25.
//
import SwiftUI

struct DetailsView: View {
    var category = "Passed Data"
    var interviewQuestions = ["API Test"]
    var dataStructures = ["Queues"]
    @State private var showingSheet = false
    @State var subCategory = ""
    var body: some View {
        VStack {
            if category == "Interview Questions" {
                List(interviewQuestions, id: \.self) { item in
                    Button(action: {
                        subCategory = item
                        showingSheet.toggle()
                    }, label: {
                        Text(item)
                    })
                }
                .navigationTitle("Interview Questions")
            }
            else if category == "Data Structures" {
                List(dataStructures, id: \.self) { item in
                    Button(action: {
                        subCategory = item
                        showingSheet.toggle()
                    }, label: {
                        Text(item)
                    })
                }
                .navigationTitle("Interview Questions")
            }else {
                List(interviewQuestions, id: \.self) { item in
                    Text(item)
                }
                .navigationTitle("Something else")
            }
        }
        .sheet(isPresented: $showingSheet) {
            SheetView(category:category, subCategory: subCategory)
        }
    }
}
