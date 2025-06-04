//
//  TeacherList.swift
//  Task1.SwiftUI
//
//  Created by Greatify on 08/05/25.
//

import SwiftUI
import Combine
import Foundation

struct Teacher: Identifiable {
    let id = UUID()
    let name: String
    let photo: String
    let teacherID: String
    let classInfo: String
    let status: String
}

class TeacherWorkloadViewModel: ObservableObject {
    @Published var selectedClass: String = "All"
    @Published var selectedSection: String = "All"
    @Published var selectedSubject: String = "All"
    @Published var searchText: String = ""

    @Published var allTeachers: [Teacher] = [
        Teacher(name: "Harriet Fisher", photo: "teacher1", teacherID: "SCHTE005", classInfo: "7th A, 8th B & C", status: "Present"),
        Teacher(name: "Caroline", photo: "teacher2", teacherID: "SCHTE005", classInfo: "6th A", status: "Absent"),
        Teacher(name: "Genevieve", photo: "teacher3", teacherID: "SCHTE005", classInfo: "7th A", status: "Present"),
        Teacher(name: "Ellen Gill", photo: "teacher4", teacherID: "SCHTE005", classInfo: "8th B", status: "Present"),
        Teacher(name: "Ina Reyes", photo: "teacher5", teacherID: "SCHTE005", classInfo: "7th A, 8th B & C", status: "Present"),
        Teacher(name: "Jensen", photo: "teacher6", teacherID: "SCHTE005", classInfo: "7th A, 8th B & C", status: "Present"),
        Teacher(name: "Harriet Fisher", photo: "teacher1", teacherID: "SCHTE005", classInfo: "7th A, 8th B & C", status: "Present")
    ]

   
    let filterOptions = ["All", "A", "B", "C"] 
    var filteredTeachers: [Teacher] {
        var filtered = allTeachers

      
        if selectedClass != "All" {
            filtered = filtered.filter { $0.classInfo.contains(selectedClass) }
        }

      
        if selectedSection != "All" {
            filtered = filtered.filter { $0.classInfo.contains(selectedSection) }
        }

        
        if selectedSubject != "All" {
          
            if selectedSubject == "Present" || selectedSubject == "Absent" { 
                filtered = filtered.filter { $0.status == selectedSubject }
            } else {
                filtered = filtered.filter { $0.classInfo.contains(selectedSubject) }
            }
        }


       
        if !searchText.isEmpty {
            filtered = filtered.filter { teacher in
                teacher.name.localizedCaseInsensitiveContains(searchText) ||
                teacher.teacherID.localizedCaseInsensitiveContains(searchText) ||
                teacher.classInfo.localizedCaseInsensitiveContains(searchText) ||
                teacher.status.localizedCaseInsensitiveContains(searchText)
            }
        }

        return filtered
    }
}

#Preview {
    ContentView()
}

