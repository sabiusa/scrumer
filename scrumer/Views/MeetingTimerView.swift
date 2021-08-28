//
//  MeetingTimerView.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 28.08.21.
//

import SwiftUI

struct MeetingTimerView: View {
    
    let speakers: [ScrumTimer.Speaker]
    var scrumColor: Color
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            
            VStack {
                Text(currentSpeaker)
                    .font(.title)
                
                Text("is speaking")
            }
            .accessibilityElement(children: .combine)
            .foregroundColor(scrumColor.accessibleFontColor)
        }
        .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    
    static var previews: some View {
        MeetingTimerView(
            speakers: [
                ScrumTimer.Speaker(name: "Kim", isCompleted: true),
                ScrumTimer.Speaker(name: "Bill", isCompleted: false)
            ],
            scrumColor: Color("Design")
        )
    }
}