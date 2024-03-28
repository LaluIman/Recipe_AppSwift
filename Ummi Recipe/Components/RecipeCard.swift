//
//  RecipeCard.swift
//  Ummi Recipe
//
//  Created by Lalu Iman Abdullah on 28/03/24.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    var body: some View {
        VStack(alignment: .leading){
            VStack {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 130)
                    .padding(10)
                .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            // text
            VStack(alignment: .leading, spacing: 8){
                Text(recipe.headline)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .foregroundStyle(.gray)
                
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(recipe.ingredients.joined(separator: ", "))
                    .font(.subheadline)
                    .frame(width: 300, height: 40, alignment: .topLeading)
                
            }
        }
    }
}

#Preview {
    RecipeCard(recipe: Recipe(title: "Classic Margherita Pizza", headline: "Lunch",
                      ingredients: ["Pizza dough", "Tomatoes", "Fresh mozzarella", "Basil", "Olive oil"],
                      instructions: "Start by preheating your oven to its highest temperature. Roll out the pizza dough into your desired shape. Spread a thin layer of crushed tomatoes over the dough, leaving a border around the edges. Tear the fresh mozzarella into small pieces and distribute them evenly over the tomatoes. Sprinkle fresh basil leaves on top. Drizzle a bit of olive oil over the pizza. Bake the pizza on a preheated pizza stone or baking sheet until the crust is golden and the cheese is bubbly, about 10-12 minutes. Remove from the oven, let it cool slightly, and enjoy your homemade Margherita pizza.",
                      imageName: "pizza"))
}
