//
//  TodoModel.swift
//  midtermQ2
//
//  Created by Joanne Liu on 3/29/24.
//
import SwiftUI

class TodoModel: ObservableObject {
    static let shared = TodoModel()
    @Published var arr: [String] = []
    
    func addTask(_ task: String) {
        arr.append(task)
    }
    
    func removeTask(at index: Int) {
        arr.remove(at: index)
    }
}
