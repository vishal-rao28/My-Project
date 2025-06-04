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

    // The data source for teachers
    @Published var allTeachers: [Teacher] = [
        Teacher(name: "Harriet Fisher", photo: "teacher1", teacherID: "SCHTE005", classInfo: "7th A, 8th B & C", status: "Present"),
        Teacher(name: "Caroline", photo: "teacher2", teacherID: "SCHTE005", classInfo: "6th A", status: "Absent"),
        Teacher(name: "Genevieve", photo: "teacher3", teacherID: "SCHTE005", classInfo: "7th A", status: "Present"),
        Teacher(name: "Ellen Gill", photo: "teacher4", teacherID: "SCHTE005", classInfo: "8th B", status: "Present"),
        Teacher(name: "Ina Reyes", photo: "teacher5", teacherID: "SCHTE005", classInfo: "7th A, 8th B & C", status: "Present"),
        Teacher(name: "Jensen", photo: "teacher6", teacherID: "SCHTE005", classInfo: "7th A, 8th B & C", status: "Present"),
        Teacher(name: "Harriet Fisher", photo: "teacher1", teacherID: "SCHTE005", classInfo: "7th A, 8th B & C", status: "Present")
    ]

    // Filter options moved from global scope
    let filterOptions = ["All", "A", "B", "C"] // Assuming these are common for Class, Section, Subject

    // Computed property to apply filters and search
    var filteredTeachers: [Teacher] {
        var filtered = allTeachers

        // Apply Class filter
        if selectedClass != "All" {
            filtered = filtered.filter { $0.classInfo.contains(selectedClass) }
        }

        // Apply Section filter (assuming sections are part of classInfo, e.g., "7th A")
        if selectedSection != "All" {
            filtered = filtered.filter { $0.classInfo.contains(selectedSection) }
        }

        // Apply Subject filter (this part needs actual subject data in Teacher if it's to filter subjects)
        // For now, assuming subject filter might apply to classInfo or status for demonstration
        // If real subject data existed, it would be: $0.subjects.contains(selectedSubject)
        if selectedSubject != "All" {
             // Placeholder: For a real app, you'd need a 'subjects' property in Teacher struct
             // For this example, we'll filter by status based on subject.
             // This needs to be refined if actual subject data is introduced.
            if selectedSubject == "Present" || selectedSubject == "Absent" { // Example: If subject is status
                filtered = filtered.filter { $0.status == selectedSubject }
            } else { // Fallback for other arbitrary "subject" filters
                filtered = filtered.filter { $0.classInfo.contains(selectedSubject) }
            }
        }


        // Apply Search text filter
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

