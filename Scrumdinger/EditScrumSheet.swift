//
//  EditScrumView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/27/23.
//

import SwiftUI

struct EditScrumSheet: View {
  @Binding var scrum: DailyScrum
  @Binding var isEditing: Bool

  var body: some View {
    NavigationStack {
      ScrumEditView(scrum: $scrum)
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
            }
          }
        }
    }
  }
}

#Preview {
  EditScrumSheet(scrum: .constant(DailyScrum.sampleData[0]), isEditing: .constant(true))
}
