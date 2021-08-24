//
//  CardView.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 24.08.21.
//

import SwiftUI

struct CardView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct CardView_Previews: PreviewProvider {
    
    static let scrum = DailyScrum.data[0]
    
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
