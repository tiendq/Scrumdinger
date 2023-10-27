//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/27/23.
//

import SwiftUI

struct NewScrumSheet: View {
  @State private var newScrum = DailyScrum.emptyScrum
  @Binding var isNewScrum: Bool
  @Binding var scrums: [DailyScrum]

  var body: some View {
    NavigationStack {
      ScrumEditView(scrum: $newScrum)
        .toolbar {
          ToolbarItem(placement: .cancellationAction) {
            Button("Dismiss") {
              isNewScrum = false
            }
          }
          ToolbarItem(placement: .confirmationAction) {
            Button("Add") {
              scrums.append(newScrum)
              isNewScrum = false
            }
          }
        }
    }
  }
}

#Preview {
  NewScrumSheet(isNewScrum: .constant(true), scrums: .constant(DailyScrum.sampleData))
}
