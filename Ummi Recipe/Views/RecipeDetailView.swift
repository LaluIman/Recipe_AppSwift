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
      ScrollView {
        VStack(alignment: .leading) {
          VStack {
            Image(recipe.imageName)
              .resizable()
              .scaledToFill()
              .frame(maxHeight: 250)
              .padding(10)
          }
          .background(.gray.opacity(0.0))
          .clipShape(RoundedCorners(radius: 50))
          .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 5)
          .padding()

          // Recipe title, subtitle, and cooking time section
          Section {
            HStack {
              Text(recipe.headline)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .padding(5)
                .background(.blue.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 5))

              HStack {
                Text(recipe.subheadline)
                  .fontWeight(.bold)
                  .font(.system(size: 20))
                  .foregroundStyle(.white)
                Image(systemName: "timer")
                  .fontWeight(.bold)
                  .foregroundStyle(Color.white)
                  .padding(.horizontal)
                .padding(.leading, -20)
                .padding(.trailing, -10)
              }
              .padding(5)
              .background(.orange.opacity(0.9))
              .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .padding(.horizontal)
            .padding(.vertical, 2)
            .padding(.top, -6)
          }

          // Ingredients section
          Section {
              VStack(alignment: .leading) {
                  Text("Ingredients:")
                      .font(.title).bold()
                      .padding()
                  
                  ScrollView(.horizontal, showsIndicators: false) {
                      LazyHStack(spacing: -20) {
                          ForEach(Array(recipe.ingredients.enumerated()), id: \.element){ index, ingredient in Text(ingredient) .fontWeight(.bold) .foregroundStyle(Color.white) .padding(10) .background(.blue.opacity(0.9)) .clipShape(RoundedRectangle(cornerRadius: 5))
                          }
                          .padding(.horizontal)
                      }
                  }
                  .frame(height: 50)
                  
                  
                  
                  // Instructions section
                  VStack(alignment: .leading) {
                      Text("Instructions:")
                          .font(.title).bold()
                          .padding(.vertical, 5)
                          .padding()
                      Text(recipe.instructions)
                          .font(.body)
                          .fontWeight(.medium)
                          .frame(maxHeight: .infinity, alignment: .top)
                          .padding()
                          .padding(.bottom, 40)
                  }
              }
          }
          .background(.white)
          .cornerRadius(25, corners: [.topLeft, .topRight])
        }
      }
      .background(LinearGradient(colors: [.gray.opacity(0.2),.gray.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
      .navigationTitle(recipe.title)
      .navigationBarItems(trailing: Button(action: {
        }) {
            ZStack{
                Image(systemName: "xmark.circle")
                    .foregroundStyle(.black)
                    .font(.title)
                Image(systemName: "xmark.circle.fill")
                      .foregroundStyle(.white)
                  .font(.title)
                  .onTapGesture{dismiss()}
            }
        })
    }
  }
}


#Preview {
    RecipeDetailView(recipe: 
            Recipe(title: "Margherita Pizza", headline: "Lunch",  subheadline: "30 minute",
                         ingredients: ["Pizza dough", "Tomatoes", "Fresh mozzarella", "Basil", "Olive oil"],
                         instructions: "Start by preheating your oven to its highest temperature. Roll out the pizza dough into your desired shape. Spread a thin layer of crushed tomatoes over the dough, leaving a border around the edges. Tear the fresh mozzarella into small pieces and distribute them evenly over the tomatoes. Sprinkle fresh basil leaves on top. Drizzle a bit of olive oil over the pizza. Bake the pizza on a preheated pizza stone or baking sheet until the crust is golden and the cheese is bubbly, about 10-12 minutes. Remove from the oven, let it cool slightly, and enjoy your homemade Margherita pizza.",
                         imageName: "pizza-margarita"))
}
