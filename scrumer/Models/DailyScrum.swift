//
//  DailyScrum.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 24.08.21.
//

import SwiftUI

struct DailyScrum {
    let title: String
    let attendees: [String]
    let lengthInMinutes: Int
    let color: Color
}

extension DailyScrum {
    static let data = [
        DailyScrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            lengthInMinutes: 10,
            color: Color("Design")
        ),
        DailyScrum(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
            lengthInMinutes: 5,
            color: Color("App Dev")
        ),
        DailyScrum(
            title: "Web Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
            lengthInMinutes: 1,
            color: Color("Web Dev")
        )
    ]
}
