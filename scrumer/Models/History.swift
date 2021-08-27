//
//  History.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 27.08.21.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [String]
    var lengthInMinutes: Int

    init(
        id: UUID = UUID(),
        date: Date = Date(),
        attendees: [String],
        lengthInMinutes: Int
    ) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}
