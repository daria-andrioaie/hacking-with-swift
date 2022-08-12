//
//  Programatically changing views.swift
//  NavigationView
//
//  Created by Daria Andrioaie on 12.08.2022.
//

import SwiftUI

class User: ObservableObject {
    @Published var score = 0
}

struct ChangeView: View {
    @EnvironmentObject var user: User

    var body: some View {
        VStack {
            Text("Score: \(user.score)")
            Button("Increase") {
                self.user.score += 1
            }
        }
    }
}

struct Programatically_changing_views: View {
    @State private var selection: String? = nil
    @State private var isShowingDetailView = false
    
    
    // V3 -> Using environment object
    @ObservedObject var user = User()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                // V1 -> tag and selection
                NavigationLink(destination: Text("Second view"), tag: "Second", selection: $selection) { EmptyView() }
                
                NavigationLink(destination: Text("Third view"), tag: "Third", selection: $selection) { EmptyView() }
                
                // V2 -> isActive
                
                NavigationLink(destination: Text("Detail view"), isActive: $isShowingDetailView) { EmptyView() }
                
                Button("Tap to show second") {
                    self.selection = "Second"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.selection = nil
                    }
                }
                Button("Tap to show third") {
                    self.selection = "Third"
                }
                
                Button("Tap to show detail view") {
                    self.isShowingDetailView = true
                }
                
                Text("Score \(user.score)")
                NavigationLink {
                    ChangeView()
                } label: {
                    Text("Show user view")
                }
            }
            .navigationBarTitle("Navigation")
        }
        .environmentObject(user)
    }
}

struct Programatically_changing_views_Previews: PreviewProvider {
    static var previews: some View {
        Programatically_changing_views()
    }
}
