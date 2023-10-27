//
//  History.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/27/23.
//

import Foundation

struct History: Identifiable {
  let id: UUID = UUID()
  let date: Date = Date()
  var attendees: [DailyScrum.Attendee]
}
