//
//  ScrumListView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/25/23.
//

import SwiftUI

struct ScrumListView: View {
  @Binding var scrums: [DailyScrum]

  var body: some View {
    NavigationStack {
      List($scrums) { $scrum in
        NavigationLink(destination: ScrumDetailView(scrum: $scrum)) {
          CardView(scrum: scrum)
        }
        .listRowBackground(scrum.theme.mainColor)
      }
      .navigationTitle("Daily Scrums")
      .toolbar {
        Button(action: {}) {
          Image(systemName: "plus")
        }
        .accessibilityLabel("New Scrum")
      }
    }
  }
}

#Preview {
  ScrumListView(scrums: .constant(DailyScrum.sampleData))
}
