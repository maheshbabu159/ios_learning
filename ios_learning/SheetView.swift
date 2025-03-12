//
//  SheetView.swift
//  ios_learning
//
//  Created by Maheshbabu Somineni on 3/12/25.
//
import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    var item = "Passed Data"

    var body: some View {
        VStack {
            if item == "API Test" {
                APITestView()
            } else {
                APITestView()
            }
            Spacer()
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
