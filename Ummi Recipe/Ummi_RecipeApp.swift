//
//  Ummi_RecipeApp.swift
//  Ummi Recipe
//
//  Created by Lalu Iman Abdullah on 28/03/24.
//

import SwiftUI

@main
struct Ummi_RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeView(recipeManager: RecipeManager())
        }
    }
}
