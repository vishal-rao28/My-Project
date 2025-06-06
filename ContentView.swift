//
//  ContentView.swift
//  Task1.SwiftUI
//
//  Created by Greatify on 08/05/25.
//

//
//  ContentView.swift
//  Task1.SwiftUI
//
//  Created by Greatify on 08/05/25.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = TeacherWorkloadViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                Text("Teacher Workload")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
            }
            .padding()
            .background(Color.chalkgreen) 

            HStack(spacing: 12) {
              
                filterMenu(title: "Class", selection: $viewModel.selectedClass, options: viewModel.filterOptions)
                filterMenu(title: "Section", selection: $viewModel.selectedSection, options: viewModel.filterOptions)
                filterMenu(title: "Subject", selection: $viewModel.selectedSubject, options: viewModel.filterOptions)
            }
            .padding(.horizontal)

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.grey02) 
                TextField("Search", text: $viewModel.searchText)
                    .disableAutocorrection(true)
            }
            .padding(12)
            .background(Color.white)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.grey02.opacity(0.3)))
            .padding(.horizontal)

            ScrollView {
                VStack(spacing: 12) {
                 
                    ForEach(viewModel.filteredTeachers) { teacher in
                        TeacherCardView(teacher: teacher)
                    }
                }
                .padding(.top)
            }

        }
        .background(Color.white.ignoresSafeArea())
    }

    
    @ViewBuilder
    func filterMenu(title: String, selection: Binding<String>, options: [String]) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color.grey02) 
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selection.wrappedValue = option
                    }
                }
            } label: {
                HStack {
                    Text(selection.wrappedValue)
                        .foregroundColor(.chalkgreen)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3)))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
