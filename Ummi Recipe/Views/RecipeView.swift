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
  @State private var searchTerm: String = ""

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center) {
          VStack {
            Text("Welcome Cookers!")
              .foregroundStyle(.green)
              .font(.system(size: 37))
              .fontWeight(.bold)
            Text("Make the food, Because you are")
              .fontWeight(.medium)
            Text("food warrior ⚔!")
              .fontWeight(.bold)
              HStack{
                  TextField("Search Recipes", text: $searchTerm)
                  Image(systemName: "magnifyingglass")
              }
              .textFieldStyle(RoundedBorderTextFieldStyle())
              .foregroundColor(.black)
              .padding(.horizontal, 30)
          }
          .padding(.vertical, 20)
          .padding(.bottom, 20)


          ForEach(searchTerm.isEmpty ? recipeManager.recipes : recipeManager.recipes.filter {
            $0.title.lowercased().contains(searchTerm.lowercased())
          }) { recipe in
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
        .padding(.vertical, 3)
      }
      .background(.ultraThickMaterial)
      .navigationBarItems(trailing: refreshButton)
    }
  }

  var refreshButton: some View {
    Button(action: {
      recipeManager.recipes.shuffle()
    }) {
      HStack(spacing: 0.2) {
        Text("Refresh")
          .font(.system(size: 20))
          .foregroundStyle(.green)
          .fontWeight(.medium)
        ZStack {
          Image(systemName: "arrow.clockwise.circle")
            .font(.title2)
            .foregroundStyle(.white)
          Image(systemName: "arrow.clockwise.circle.fill")
            .font(.title2)
            .foregroundColor(.green)
        }
      }
    }
  }
}

#Preview {
  RecipeView(recipeManager: RecipeManager())
}
