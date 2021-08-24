//
//  EditView.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 24.08.21.
//

import SwiftUI

struct EditView: View {
    
    @State private var data = DailyScrum.Data()
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $data.title)
                
                HStack {
                    Slider(
                        value: $data.lengthInMinutes,
                        in: 5 ... 30,
                        step: 1.0,
                        label: { Text("Length") }
                    )
                    
                    Spacer()
                    
                    Text("\(Int(data.lengthInMinutes)) minutes")
                }
                
                ColorPicker("Color", selection: $data.color)
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            EditView()
        }
    }
}
