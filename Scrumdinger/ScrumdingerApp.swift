//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/24/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
  @State private var scrums = DailyScrum.sampleData

  var body: some Scene {
    WindowGroup {
      ScrumListView(scrums: $scrums)
    }
  }
}
