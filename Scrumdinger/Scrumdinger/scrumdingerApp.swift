//
//  scrumdingerApp.swift
//  scrumdinger
//
//  Created by 이전희 on 2022/03/29.
//

import SwiftUI

@main
struct scrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
