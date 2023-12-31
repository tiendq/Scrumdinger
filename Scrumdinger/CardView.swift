//
//  CardView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/24/23.
//

import SwiftUI

struct CardView: View {
  let scrum: DailyScrum

  var body: some View {
    VStack(alignment: .leading) {
      Text(scrum.title)
        .font(.headline)
        .accessibilityAddTraits(.isHeader)
      Spacer()
      HStack {
        Label("\(scrum.attendees.count)", systemImage: "person.2")
          .accessibilityLabel("\(scrum.attendees.count) attendees")
        Spacer()
        Label("\(scrum.lengthInMinutes)", systemImage: "clock")
          .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
          .labelStyle(.trailingIcon)
      }
      .font(.caption)
    }
    .padding()
    .foregroundColor(scrum.theme.accentColor)
  }
}

#Preview {
  var scrum = DailyScrum.sampleData[0]

  return CardView(scrum: scrum)
    .background(scrum.theme.mainColor)
    .previewLayout(.fixed(width: 400, height: 60))
}
