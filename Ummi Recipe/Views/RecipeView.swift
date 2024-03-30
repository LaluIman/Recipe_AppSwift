//
//  RecipeView.swift
//  Ummi Recipe
//
//  Created by Lalu Iman Abdullah on 28/03/24.
//

import SwiftUI

struct RecipeView: View {
    @ObservedObject var recipeManager: RecipeManager
    @State var selectedRecipe: Recipe? = nil
    let numberOfRectangles = 5
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .leading){
                    VStack {
                        Text("Menu Populer")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    ForEach(recipeManager.recipes.shuffled()){ recipe in
                        RecipeCard(recipe: recipe)
                            .onTapGesture {
                                selectedRecipe = recipe
                            }
                    }
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .fullScreenCover(item: $selectedRecipe) { recipe in
                        RecipeDetailView(recipe: recipe)
                    }
                }
                .padding(.vertical)
            }
            .background(.ultraThinMaterial)
            .navigationTitle("Recipes🍳")
        }
    }
}

#Preview {
    RecipeView(recipeManager: RecipeManager())
}
