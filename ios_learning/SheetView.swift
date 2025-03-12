//
//  SheetView.swift
//  ios_learning
//
//  Created by Maheshbabu Somineni on 3/12/25.
//
import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    var category = "Category"
    var subCategory = "Passed Data"

    var body: some View {
        VStack {
            if category == "Interview Questions" {
                if subCategory == "API Test" {
                    APITestView()
                } else {
                    APITestView()
                }
            } else {
                if subCategory == "Queues" {
                    QueuesView()
                } else {
                    QueuesView()
                }
            }
            Spacer()
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
