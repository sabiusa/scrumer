//
//  MeetingTimerView.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 28.08.21.
//

import SwiftUI

struct MeetingTimerView: View {
    
    let speakers: [ScrumTimer.Speaker]
    let isRecording: Bool
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
                
                Image(systemName: isRecording ? "mic" : "mic.slash")
                    .font(.title)
                    .padding(.top)
                    .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
            }
            .accessibilityElement(children: .combine)
            .foregroundColor(scrumColor.accessibleFontColor)
            
            ForEach(speakers) { speaker in
                if speaker.isCompleted,
                   let index = speakers.firstIndex(where: { $0.id == speaker.id })
                {
                    SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                        .rotation(Angle(degrees: -90))
                        .stroke(scrumColor, lineWidth: 12)
                }
            }
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
            isRecording: true,
            scrumColor: Color("Design")
        )
    }
}
