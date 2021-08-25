//
//  ScrumProgressViewStyle.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 25.08.21.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    
    let scrumColor: Color

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(scrumColor.accessibleFontColor)
                .frame(height: 20.0)
            ProgressView(configuration)
                .frame(height: 12.0)
                .padding(.horizontal)
        }
    }
}
