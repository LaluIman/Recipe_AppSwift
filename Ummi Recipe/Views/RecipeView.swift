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
//                HorizontalScrolling(recipeManager: recipeManager)
//                    .padding(.vertical)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(recipeManager.recipes){ recipe in
                            Text(recipe.title)
                                .foregroundStyle(Color.white)
                                .font(.system(size: 20)).bold()
                                .padding(10)
                                .background(.gray.opacity(0.6))
                                .clipShape(RoundedCorners(radius: 10))
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, -3)
                .padding(.top, 5)
            
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
