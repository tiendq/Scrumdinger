//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/24/23.
//

import Foundation

struct DailyScrum: Identifiable {
  var id: UUID = UUID()
  var title = ""
  var attendees: [Attendee] = []
  var theme: Theme = .sky
  var history: [History] = []

  var lengthInMinutes = 5
  var lengthInMinutesAsDouble: Double {
    get {
      Double(lengthInMinutes)
    }
    set {
      lengthInMinutes = Int(newValue)
    }
  }
}

extension DailyScrum {
  struct Attendee: Identifiable {
    let id: UUID = UUID()
    var name: String
  }

  static var emptyScrum: DailyScrum {
    DailyScrum()
  }
}

extension DailyScrum {
  static let sampleData: [DailyScrum] = [
    DailyScrum(title: "Design",
               attendees: ["Cathy", "Daisy", "Simon", "Jonathan"].map { Attendee(name: $0) },
               theme: .yellow,
               lengthInMinutes: 5),
    DailyScrum(title: "App Dev",
               attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"].map { Attendee(name: $0) },
               theme: .orange,
               lengthInMinutes: 5),
    DailyScrum(title: "Web Dev",
               attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"].map { Attendee(name: $0) },
               theme: .poppy,
               lengthInMinutes: 10)
  ]
}
