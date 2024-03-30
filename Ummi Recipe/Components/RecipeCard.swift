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
                    //a.scaledToFit()
                    .scaledToFill() //fill all space
                    .frame(maxHeight: 190)
                    .padding(10)
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
            .background(.gray.opacity(0.0))
            .clipShape(RoundedCorners(radius: 70))
            .shadow(color:.black.opacity(0.1), radius: 10, x: 0, y: 6)
            
            // text
            VStack(alignment: .leading, spacing: 8){
                HStack {
                    Text(recipe.headline)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(.blue.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    HStack{
                        Text(recipe.subheadline)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                            .padding(5)
                        Image(systemName: "timer")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(.horizontal)
                            .padding(.leading, -20)
                            .padding(.trailing, -10)
                    }
                    .background(.orange.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                
                Text(recipe.title)
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                
                Text(recipe.ingredients.joined(separator: ", "))
                    .font(.system(size: 15))
                    .frame(width: 300, height: 40, alignment: .topLeading)
                
            }
            .padding(.top, 2)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedCorners(radius: 25))
        .shadow(color:.black.opacity(0.2), radius: 10, x: 0, y: 6)
    }
}

#Preview {
    RecipeCard(recipe: Recipe(title: "Margherita Pizza", headline: "Lunch",  subheadline: "30 minute",
                      ingredients: ["Pizza dough", "Tomatoes", "Fresh mozzarella", "Basil", "Olive oil"],
                      instructions: "Start by preheating your oven to its highest temperature. Roll out the pizza dough into your desired shape. Spread a thin layer of crushed tomatoes over the dough, leaving a border around the edges. Tear the fresh mozzarella into small pieces and distribute them evenly over the tomatoes. Sprinkle fresh basil leaves on top. Drizzle a bit of olive oil over the pizza. Bake the pizza on a preheated pizza stone or baking sheet until the crust is golden and the cheese is bubbly, about 10-12 minutes. Remove from the oven, let it cool slightly, and enjoy your homemade Margherita pizza.",
                      imageName: "pizza-margarita"))
}
