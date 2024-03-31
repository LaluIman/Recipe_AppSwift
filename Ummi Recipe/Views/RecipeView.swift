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
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading){
//                    VStack {
//                        Text("")
//                            .font(.system(size: 40))
//                            .fontWeight(.bold)
//                            .multilineTextAlignment(.leading)
//                    }
//                    .padding()
                    
                    ForEach(recipeManager.recipes.shuffled()){ recipe in
                        RecipeCard(recipe: recipe)
                            .onTapGesture {
                                selectedRecipe = recipe
                            }
                    }
                    .padding(.bottom, 15)
                    .padding(.horizontal)
                    .fullScreenCover(item: $selectedRecipe) { recipe in
                        RecipeDetailView(recipe: recipe)
                    }
                }
                .padding(.vertical,3)
            }
            .background(.ultraThickMaterial)
            .navigationTitle("Recipes🍳")
            .navigationBarItems(leading: refreshButton)
        }
    }
    
    var refreshButton: some View {
       Button(action: {
         recipeManager.recipes.shuffle()
       }) {
           ZStack{
               Image(systemName: "arrow.clockwise.circle")
                   .font(.title)
                   .foregroundStyle(.white)
               Image(systemName: "arrow.clockwise.circle.fill")
                     .font(.title)
                     .foregroundColor(.green)
           }
       }
     }
   }

#Preview {
    RecipeView(recipeManager: RecipeManager())
}
