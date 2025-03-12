//
//  DetailsView.swift
//  ios_learning
//
//  Created by Maheshbabu Somineni on 3/12/25.
//
import SwiftUI

struct DetailsView: View {
    var item = "Passed Data"
    var interviewQuestions = ["API Test"]
    @State private var showingSheet = false
    @State var sheetViewName = ""
    var body: some View {
        VStack {
            if item == "Interview Questions" {
                List(interviewQuestions, id: \.self) { item in
                    Button(action: {
                        sheetViewName = item
                        showingSheet.toggle()
                    }, label: {
                        Text(item)
                    })
                }
                .navigationTitle("Interview Questions")
            } else {
                List(interviewQuestions, id: \.self) { item in
                    Text(item)
                }
                .navigationTitle("Something else")
            }
        }
        .sheet(isPresented: $showingSheet) {
            SheetView(item: sheetViewName)
        }
    }
}
