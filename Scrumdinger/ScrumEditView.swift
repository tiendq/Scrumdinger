//
//  ScrumEditView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/25/23.
//

import SwiftUI

struct ScrumEditView: View {
  @Binding var scrum: DailyScrum
  @State private var newAttendeeName = ""

  var body: some View {
    Form {
      Section(header: Text("Meeting Info")) {
        TextField("Title", text: $scrum.title)
        HStack {
          Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
            Text("Length")
          }
          .accessibilityValue("\(scrum.lengthInMinutes) minutes")
          Spacer()
          Text("\(scrum.lengthInMinutes) minutes")
            .accessibilityHidden(true)
        }
        ThemePicker(selection: $scrum.theme)
      }
      Section(header: Text("Attendees")) {
        ForEach(scrum.attendees) { attendee in
          Text(attendee.name)
        }
        .onDelete { indices in
          scrum.attendees.remove(atOffsets: indices)
        }
        HStack {
          TextField("New Attendee", text: $newAttendeeName)
          Button(action: {
            withAnimation {
              let attendee = DailyScrum.Attendee(name: newAttendeeName)
              scrum.attendees.append(attendee)
              newAttendeeName = ""
            }
          }) {
            Image(systemName: "plus.circle.fill")
              .accessibilityLabel("Add attendee")
          }
          .disabled(newAttendeeName.isEmpty)
        }
      }
    }
  }
}

#Preview {
  ScrumEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
