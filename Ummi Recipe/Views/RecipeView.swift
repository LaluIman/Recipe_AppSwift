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
    var body: some View {
        NavigationView{
            ScrollView{
                HorizontalScrolling(recipeManager: recipeManager)
                    .padding(.vertical)
            
                VStack{
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("Recent")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        .frame(width: 300)
                    }
                    ForEach(recipeManager.recipes){ recipe in
                        RecipeCard(recipe: recipe)
                            .onTapGesture {
                                selectedRecipe = recipe
                            }
                    }
                    .padding(.horizontal)
                    .fullScreenCover(item: $selectedRecipe) { recipe in
                        RecipeDetailView(recipe: recipe)
                    }
                }
                .padding(.vertical)
                .background(.ultraThinMaterial)
            }
            .navigationTitle("Recipe🍳")
        }
    }
}

#Preview {
    RecipeView(recipeManager: RecipeManager())
}
