//
//  ios_learningTests.swift
//  ios_learningTests
//
//  Created by Maheshbabu Somineni on 3/11/25.
//

import Testing
@testable import ios_learning

struct ios_learningTests {

    @Test func testFetchPostsSuccess() async {
        // Given
        let mockPosts = [Post(id: 1, title: "Test Post", body: "This is a test.", userId: 1)]
        let mockService = MockApiService(mockData: mockPosts)
        let viewModel = await PostsViewModel(apiService: mockService)
        
        // When
        await viewModel.fetchPosts()
        
        // Then
        Task { @MainActor in
            assert(!viewModel.isLoading, "Loading state should be false after fetching.")
            assert(viewModel.posts.count == 1, "Post count should be 1.")
            assert(viewModel.posts.first?.title == "Test Post", "Title should match mock data.")
            assert(viewModel.errorMessage == nil, "Error message should be nil on success.")
        }
    }
    
    @Test func testFetchPostsFailure() async {
        // Given
        let mockService = MockApiService(shouldThrowError: true)
        let viewModel = await PostsViewModel(apiService: mockService)
        
        // When
        await viewModel.fetchPosts()
        
        // Then
        Task { @MainActor in
            assert(!viewModel.isLoading, "Loading state should be false after failure.")
            assert(viewModel.posts.isEmpty, "Posts should be empty on failure.")
            assert(viewModel.errorMessage != nil, "Error message should not be nil on failure.")
        }
    }

}
