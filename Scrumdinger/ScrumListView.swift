//
//  ScrumListView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/25/23.
//

import SwiftUI

struct ScrumListView: View {
  @Binding var scrums: [DailyScrum]
  @State private var isNewScrum = false

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
        Button(action: {
          isNewScrum = true
        }) {
          Image(systemName: "plus")
        }
        .accessibilityLabel("New Scrum")
      }
    }
    .sheet(isPresented: $isNewScrum) {
      NewScrumSheet(isNewScrum: $isNewScrum, scrums: $scrums)
    }
  }
}

#Preview {
  ScrumListView(scrums: .constant(DailyScrum.sampleData))
}
