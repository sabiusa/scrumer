//
//  ScrumsView.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 24.08.21.
//

import SwiftUI

struct ScrumsView: View {
    
    @State private var isPresented = false
    @State private var newScrumData = DailyScrum.Data()
    
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Daily Scrums")
        .navigationBarItems(
            trailing: Button(
                action: { isPresented = true },
                label: { Image(systemName: "plus") }
            )
        )
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView(data: $newScrumData)
                    .navigationTitle("New Scrum")
                    .navigationBarItems(
                        leading: Button("Dismiss") {
                            isPresented = false
                        },
                        trailing: Button("Add") {
                            let scrum = DailyScrum(data: newScrumData)
                            scrums.append(scrum)
                            isPresented = false
                        }
                    )
            }
        }
    }
    
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        let index = scrums.firstIndex { $0.id == scrum.id }!
        return $scrums[index]
    }
}

struct ScrumsView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
