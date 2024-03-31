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
    NavigationView {
        ScrollView(.vertical, showsIndicators: false){
        VStack(alignment: .leading) {
          VStack {
            Image(recipe.imageName)
              .resizable()
              .scaledToFill()
          }
          .background(.gray.opacity(0.0))
          .clipShape(RoundedCorners(radius: 10))
          .shadow(color: .black.opacity(0.1), radius: 5, x: -1, y: 5)
          .padding()

          // Recipe title, subtitle, and cooking time section
          Section {
            HStack {
              Text(recipe.headline)
                .fontWeight(.bold)
                .font(.system(size: 23))
                .foregroundStyle(.green)
                .padding(6)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 4)

              HStack {
                Text(recipe.time)
                  .fontWeight(.bold)
                  .font(.system(size: 23))
                  .foregroundStyle(.green)
                Image(systemName: "timer")
                  .fontWeight(.bold)
                  .foregroundStyle(.green)
                  .padding(.horizontal)
                .padding(.leading, -20)
                .padding(.trailing, -10)
              }
              .padding(6)
              .background(.white)
              .clipShape(RoundedRectangle(cornerRadius: 5))
              .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 4)
            }
            .padding(.horizontal)
            .padding(.vertical, 2)
            .padding(.top, -6)
          }

          // Ingredients section
          Section {
              VStack(alignment: .leading) {
                  Text("Ingredients:")
                      .font(.largeTitle).bold()
                      .padding()
                  
                  ScrollView(.horizontal, showsIndicators: false) {
                      LazyHStack(spacing: -20) {
                          ForEach(Array(recipe.ingredients.enumerated()), id: \.element){ index, ingredient in Text(ingredient)
                                  .font(.system(size: 20))
                                  .fontWeight(.bold)
                                  .foregroundStyle(Color.white)
                                  .padding(12)
                                  .background(.green.opacity(0.9))
                                  .clipShape(RoundedRectangle(cornerRadius: 20))
                          }
                          .padding(.horizontal,13)
                      }
                  }
                  .frame(height: 50)
                  .padding(.top, -10)
                  
                  
                  
                  // Instructions section
                  VStack(alignment: .leading) {
                      Text("Instructions:")
                          .font(.largeTitle).bold()
                          .padding(.vertical, 5)
                          .padding()
                      Text(recipe.instructions)
                          .font(.system(size: 20))
                          .fontWeight(.medium)
                          .frame(maxHeight: .infinity, alignment: .top)
                          .padding()
                          .padding(.top, -20)
                          .padding(.bottom, 40)
                  }
              }
          }
          .background(Color.white)
          .cornerRadius(25, corners: [.topLeft, .topRight])
        }
      }
      .background(.gray.opacity(0.1))
      .navigationTitle(recipe.title)
      .navigationBarItems(trailing: Button(action: {
        }) {
            ZStack{
                Image(systemName: "xmark.circle")
                    .foregroundStyle(.white)
                    .font(.title)
                Image(systemName: "xmark.circle.fill")
                      .foregroundStyle(.green)
                  .font(.title)
                  .onTapGesture{dismiss()}
            }
        })
    }
  }
}


#Preview {
    RecipeDetailView(recipe: 
            Recipe(title: "Margherita Pizza", headline: "Lunch",  time: "30 minute",
                         ingredients: ["Pizza dough", "Tomatoes", "Fresh mozzarella", "Basil", "Olive oil"],
                         instructions: "Start by preheating your oven to its highest temperature. Roll out the pizza dough into your desired shape. Spread a thin layer of crushed tomatoes over the dough, leaving a border around the edges. Tear the fresh mozzarella into small pieces and distribute them evenly over the tomatoes. Sprinkle fresh basil leaves on top. Drizzle a bit of olive oil over the pizza. Bake the pizza on a preheated pizza stone or baking sheet until the crust is golden and the cheese is bubbly, about 10-12 minutes. Remove from the oven, let it cool slightly, and enjoy your homemade Margherita pizza.",
                         imageName: "pizza-margarita"))
}
