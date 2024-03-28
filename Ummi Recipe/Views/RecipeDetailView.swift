//
//  RecipeDetailView.swift
//  Ummi Recipe
//
//  Created by Lalu Iman Abdullah on 28/03/24.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    VStack{
                        Image(recipe.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 150)
                            .padding(10)
                        .shadow(color: .black.opacity(0.3), radius: 4, x:0, y:5)
                    }
                    .background(.gray.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    
                    Text(recipe.headline)
                        .font(.title).bold()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Instructions")
                                .font(.title).bold()
                                .padding(.vertical, 5)
                            Text(recipe.instructions)
                                .font(.body)
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding()
                        
                        VStack(alignment: .leading){
                            Text("Ingredients")
                                .font(.title).bold()
                                .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                LazyHStack(spacing: -20){
                                    ForEach(Array(recipe.ingredients.enumerated()), id: \.element){ index, ingredient in
                                        Text(ingredient)
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color.white)
                                            .padding(10)
                                            .background(.gray.opacity(0.6))
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .frame(height: 50)
                        }
                    }
                    .frame(width: .infinity, height: 500, alignment: .bottomLeading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
            }
            .background(.ultraThinMaterial)
            .navigationTitle(recipe.title)
            .navigationBarItems(trailing: Image(systemName: "xmark.circle.fill").onTapGesture{dismiss()})
        }
    }
}

#Preview {
    RecipeDetailView(recipe: 
            Recipe(title: "Classic Margherita Pizza", headline: "Lunch",
                         ingredients: ["Pizza dough", "Tomatoes", "Fresh mozzarella", "Basil", "Olive oil"],
                         instructions: "Start by preheating your oven to its highest temperature. Roll out the pizza dough into your desired shape. Spread a thin layer of crushed tomatoes over the dough, leaving a border around the edges. Tear the fresh mozzarella into small pieces and distribute them evenly over the tomatoes. Sprinkle fresh basil leaves on top. Drizzle a bit of olive oil over the pizza. Bake the pizza on a preheated pizza stone or baking sheet until the crust is golden and the cheese is bubbly, about 10-12 minutes. Remove from the oven, let it cool slightly, and enjoy your homemade Margherita pizza.",
                         imageName: "pizza"))
}
