//
//  ViewBuilder.swift
//  Task1.SwiftUI
//
//  Created by Greatify on 08/05/25.
//

import SwiftUI

struct TeacherCardView: View {
    let teacher: Teacher

    var statusColor: Color {
        teacher.status == "Present" ? Color("TagGreenBG") : Color("TagRedBG")
    }

    var statusTextColor: Color {
        teacher.status == "Present" ? Color("TagGreenText") : Color("TagRedText")
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(teacher.photo) 
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(teacher.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.chalkgreen) 
                Text("ID: \(teacher.teacherID)")
                    .font(.system(size: 13))
                    .foregroundColor(.chalkgreen03) 

                HStack {
                    Text("Class : ")
                        .font(.system(size: 13))
                        .foregroundColor(.graphViolet) 
                    Text(teacher.classInfo)
                        .font(.system(size: 13))
                        .foregroundColor(.chalkgreen)
                        .padding(.trailing, 16)
                }
            }

            Spacer()

            Text(teacher.status)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(statusTextColor)
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .background(statusColor)
                .cornerRadius(8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.stokeGrey) 
        )
        .padding(.horizontal)
    }
}
