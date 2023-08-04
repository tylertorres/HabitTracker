//
//  APIClient.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/28/23.
//

import Foundation

protocol API {
    func getHabits(for user: String) async throws -> [Habit]
    func saveHabit(user: UUID, habitName: String) async throws -> Void
}

class APIClient : API {
    static let shared = APIClient()
    
    private let scheme : String = "http://"
    private let port : String = ":8080"
    
    private let baseUrl = "http://10.0.0.187:8080"
    private let usersPath : String = "/users"
    private let habitsPath : String =  "/habits"
    
    private let urlSession : URLSession = URLSession.shared
    
    func getHabits(for user: String) async throws -> [Habit] {
        let request = createGetHabitsRequest(userId: user)
        
        let (data, _) = try await urlSession.data(for: request)
        
        let habitsResponse = try JSONDecoder().decode(HabitResponse.self, from: data)
        
        guard let habits = habitsResponse.habits else { return [] }
        
        return habits
    }
    
    func saveHabit(user: UUID, habitName: String) async throws -> Void {
        try await Task.sleep(for: Duration.seconds(5))
        
        return
        
        let request = createInsertHabitRequest(userId: user, habitName: habitName)
        
        let (data, _) = try await urlSession.data(for: request)
        
        let _ = try JSONDecoder().decode(InsertHabitResponse.self, from: data)
        
        print("Successfully persisted habit \(habitName) for user \(user)")
    }
    
    private func createGetHabitsRequest(userId: String) -> URLRequest {
        let endpointUrl = baseUrl + usersPath + "/\(userId)" + habitsPath
        var request = URLRequest(url: URL(string: endpointUrl)!)
        request.httpMethod = "GET"
        
        return request
    }
    
    private func createInsertHabitRequest(userId: UUID, habitName: String) -> URLRequest {
        let requestBody = ["name" : habitName]
        let endpointUrl = baseUrl + usersPath + "\(userId)" + habitsPath
        var request = URLRequest(url: URL(string: endpointUrl)!)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            print(error)
        }
        
        return request
    }
}
