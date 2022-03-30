//
//  scrumdingerApp.swift
//  scrumdinger
//
//  Created by 이전희 on 2022/03/29.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
