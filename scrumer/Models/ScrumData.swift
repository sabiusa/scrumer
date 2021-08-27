//
//  ScrumData.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 27.08.21.
//

import Foundation

class ScrumData: ObservableObject {
    
    @Published var scrums = [DailyScrum]()
    
    private static var documentsFolderURL: URL {
        do {
            return try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
        } catch {
            fatalError("No document directory")
        }
    }
    private static var fileURL: URL {
        return documentsFolderURL.appendingPathComponent("scrums.data")
    }
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL)
            else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.scrums = DailyScrum.data
                }
                #endif
                
                return
            }
            
            guard let dailyScrums = try? JSONDecoder().decode([DailyScrum].self, from: data)
            else { fatalError("Can't decode saved scrum data") }
            
            DispatchQueue.main.async {
                self?.scrums = dailyScrums
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let scrums = self?.scrums
            else { fatalError("Self out of scope") }
            
            guard let data = try? JSONEncoder().encode(scrums)
            else { fatalError("Error while encoding scrums") }
            
            do {
                try data.write(to: Self.fileURL)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
