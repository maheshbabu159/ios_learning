//
//  APITestView.swift
//  ios_learning
//
//  Created by Maheshbabu Somineni on 3/12/25.
//

import SwiftUI

struct APITestView: View {
    @StateObject var viewModel = PostsViewModel(apiService: APIServiceImpl())
    var body: some View {
        NavigationView {
            List(viewModel.posts)  { post in
                VStack(alignment: .leading, spacing: 10) {
                    Text("Title: \(post.title)")
                    Text("Body: \(post.body)")
                }
                .padding(10)
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
            .navigationTitle("Posts")
            .task {
                await viewModel.fetchPosts()
            }
        }
    }
}

