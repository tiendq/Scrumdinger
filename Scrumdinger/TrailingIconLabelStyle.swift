//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/24/23.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.title
      configuration.icon
    }
  }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
  static var trailingIcon: Self { Self() }
}
