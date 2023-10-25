//
//  ScrumDetailView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/25/23.
//

import SwiftUI

struct ScrumDetailView: View {
  @State private var isEditing = false
  @State private var editingScrum = DailyScrum.emptyScrum

  @Binding var scrum: DailyScrum

  var body: some View {
    List {
      Section(header: Text("Meeting Info")) {
        NavigationLink(destination: MeetingView()) {
          Label("Start Meeting", systemImage: "timer")
            .font(.headline)
            .foregroundColor(.accentColor)
        }
        HStack {
          Label("Length", systemImage: "clock")
          Spacer()
          Text("\(scrum.lengthInMinutes) minutes")
        }
        .accessibilityElement(children: .combine)
        HStack {
          Label("Theme", systemImage: "paintpalette")
          Spacer()
          Text(scrum.theme.name)
            .padding(4)
            .foregroundColor(scrum.theme.accentColor)
            .background(scrum.theme.mainColor)
            .cornerRadius(4)
        }
        .accessibilityElement(children: .combine)
      }
      Section(header: Text("Attendees")) {
        ForEach(scrum.attendees) { attendee in
          Label(attendee.name, systemImage: "person")
        }
      }
    }
    .navigationTitle(scrum.title)
    .toolbar {
      Button("Edit") {
        isEditing = true
        editingScrum = scrum
      }
    }
    .sheet(isPresented: $isEditing) {
      NavigationStack {
        ScrumEditView(scrum: $editingScrum)
          .navigationTitle(scrum.title)
          .toolbar {
            ToolbarItem(placement: .cancellationAction) {
              Button("Cancel") {
                isEditing = false
              }
            }
            ToolbarItem(placement: .confirmationAction) {
              Button("Done") {
                isEditing = false
                scrum = editingScrum
              }
            }
          }
      }
    }
  }
}

#Preview {
  NavigationStack {
    ScrumDetailView(scrum: .constant(DailyScrum.sampleData[0]))
  }
}