//
//  Theme.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/24/23.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
  case bubblegum
  case buttercup
  case indigo
  case lavender
  case magenta
  case navy
  case orange
  case oxblood
  case periwinkle
  case poppy
  case purple
  case seafoam
  case sky
  case tan
  case teal
  case yellow

  var id: String {
    name
  }

  var name: String {
    rawValue.capitalized // self. is implicit
  }

  var mainColor: Color {
    Color(self.rawValue)
  }

  var accentColor: Color {
    switch self {
      case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
        return .black
      case .indigo, .magenta, .navy, .oxblood, .purple:
        return .white
    }
  }
}
