//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Tien Do on 10/27/23.
//

import SwiftUI

struct MeetingHeaderView: View {
  let secondsElapsed: Int
  let secondsRemaining: Int
  let theme: Theme

  private var totalSeconds: Int {
    secondsElapsed + secondsRemaining
  }

  private var minutesRemaining: Int {
    secondsRemaining / 60
  }

  private var progress: Double {
    let seconds = totalSeconds > 0 ? totalSeconds : 1
    return Double(secondsElapsed) / Double(seconds)
  }

  var body: some View {
    VStack {
      ProgressView(value: progress)
        .progressViewStyle(ScrumProgressViewStyle(theme: theme))
      HStack {
        VStack(alignment: .leading) {
          Text("Seconds Elapsed")
            .font(.caption)
          Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
        }
        Spacer()
        VStack(alignment: .trailing) {
          Text("Seconds Remaining")
            .font(.caption)
          Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
            .labelStyle(.trailingIcon)
        }
      }
    }
    .padding([.top, .horizontal])
    .accessibilityElement(children: .ignore)
    .accessibilityLabel("Time remaining")
    .accessibilityValue("\(minutesRemaining) minutes")
  }
}

#Preview {
  MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .bubblegum)
    .previewLayout(.sizeThatFits)
}
