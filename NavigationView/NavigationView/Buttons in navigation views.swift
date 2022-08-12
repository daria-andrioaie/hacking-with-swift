//
//  Buttons in navigation views.swift
//  NavigationView
//
//  Created by Daria Andrioaie on 12.08.2022.
//

import SwiftUI

struct Buttons_in_navigation_views: View {
    @State private var fullScreen = false
    
    @State private var score = 0
    
    var body: some View {
//        NavigationView {
//            Text("Score: \(score)")
//                .navigationTitle("Navigation")
//                .navigationBarItems(
//                    trailing:
//                        HStack {
//                            Button("Subtract 1") {
//                                self.score -= 1
//                            }
//                            Button("Add 1") {
//                                self.score += 1
//                            }
//                        }
//                    )
//        }
        // Navigation bar hidden
//        NavigationView {
//            Button("Toggle full screen") {
//                self.fullScreen.toggle()
//            }
//            .navigationTitle("Full Screen")
//            .navigationBarHidden(fullScreen)
//        }
//        .statusBar(hidden: fullScreen)
//
        
        NavigationView {
            Text("Primary")
                .navigationBarTitle("Primary")
            Text("Secondary")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Buttons_in_navigation_views_Previews: PreviewProvider {
    static var previews: some View {
        Buttons_in_navigation_views()
            .previewInterfaceOrientation(.portrait)
    }
}
