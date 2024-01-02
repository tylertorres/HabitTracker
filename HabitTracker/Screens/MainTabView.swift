//
//  MainTabView.swift
//  HabitTracker
//
//  Created by Tyler Torres on 6/8/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HabitsView()
                .tabItem {
                    Image(systemName: "house")
                        .background { Color.red }
                    Text("Home")
                }
        }
        .tint(.accentColor)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
