//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/25/23.
//

import SwiftUI

struct ThemeView: View {
  let theme: Theme

  var body: some View {
    Text(theme.name)
      .padding(4)
      .frame(maxWidth: .infinity)
      .foregroundColor(theme.accentColor)
      .background(theme.mainColor)
      .clipShape(RoundedRectangle(cornerRadius: 4))
  }
}

#Preview {
  ThemeView(theme: Theme.buttercup)
}
