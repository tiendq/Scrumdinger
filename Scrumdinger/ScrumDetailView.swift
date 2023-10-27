//
//  ScrumDetailView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/25/23.
//

import SwiftUI

struct ScrumDetailView: View {
  @State private var isEditing = false
  @Binding var scrum: DailyScrum

  var body: some View {
    List {
      Section(header: Text("Meeting Info")) {
        NavigationLink(destination: MeetingView(scrum: $scrum)) {
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
      Section(header: Text("History")) {
        if scrum.history.isEmpty {
          Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
        }
        ForEach(scrum.history) { history in
          HStack {
            Image(systemName: "calendar")
            Text(history.date, style: .date)
          }
        }
      }
    }
    .navigationTitle(scrum.title)
    .toolbar {
      Button("Edit") {
        isEditing = true
      }
    }
    .sheet(isPresented: $isEditing) {
      EditScrumSheet(scrum: $scrum, isEditing: $isEditing)
    }
  }
}

#Preview {
  NavigationStack {
    ScrumDetailView(scrum: .constant(DailyScrum.sampleData[0]))
  }
}
