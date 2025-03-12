//
//  Post.swift
//  ios_learning
//
//  Created by Maheshbabu Somineni on 3/12/25.
//
import Foundation
import Combine
import SwiftUI

// Model (Decodable)
struct Post: Identifiable, Codable {
    let id: Int
    let title:String
    let body: String
    let userId: Int
}


// API Service Protocol (Dependency Injection)
protocol APISerivce {
    func fetchPosts() async throws -> [Post]
}

// API Service Implementation
class APIServiceImpl: APISerivce {
    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Post].self, from: data)
    }
}


// ViewModel with Dependency Injection
@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts:[Post] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let apiService: APISerivce
    init(apiService: APISerivce) {
        self.apiService = apiService
    }
    
    func fetchPosts() async {
        isLoading = true
        do {
            posts = try await apiService.fetchPosts()
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}


// Mock API Service
class MockApiService: APISerivce {
    let mockData:[Post]
    let shouldThrowError: Bool

    init(mockData: [Post] = [], shouldThrowError: Bool = false) {
        self.mockData = mockData
        self.shouldThrowError = shouldThrowError
    }
    
    func fetchPosts() async throws -> [Post] {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return mockData
    }
}



