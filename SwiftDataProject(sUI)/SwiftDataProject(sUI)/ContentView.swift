//
//  ContentView.swift
//  SwiftDataProject(sUI)
//
//  Created by David Guffre on 10/1/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> { user in
        if user.name.localizedStandardContains("R") {
            if user.city == "London" {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }, sort: \User.name) var users: [User]
    
    
    
    var body: some View {
        NavigationStack{
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Sample", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    
                    let first = User(
                        name: "Ed Sheeran",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(
                        name: "David Rosa",
                        city: "Bekerely",
                        joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(
                        name: "Bobby Diaz",
                        city: "Bali",
                        joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(
                        name: "Johnny English",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}
    #Preview {
        ContentView()
    }
