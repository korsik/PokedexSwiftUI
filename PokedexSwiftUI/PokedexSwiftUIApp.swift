//
//  PokedexSwiftUIApp.swift
//  PokedexSwiftUI
//
//  Created by Ilias Logothetis on 15/1/22.
//

import SwiftUI

@main
struct PokedexSwiftUIApp: App {
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
//    }
    
    
    var body: some Scene {
        WindowGroup {
            PokedexView()
        }
    }
}


extension View {
    @available(iOS 14, *)
    func navigationTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor]
        return self
    }
}
