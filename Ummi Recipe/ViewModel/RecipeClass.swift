//
//  RecipeClass.swift
//  Ummi Recipe
//
//  Created by Lalu Iman Abdullah on 28/03/24.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var subheadline: String
    var ingredients: [String]
    var instructions: String
    var imageName: String
}

class RecipeManager:  ObservableObject {
    @Published var recipes: [Recipe] = [
        Recipe(title: "Classic Margherita Pizza", headline: "Lunch", subheadline: "30 minute",
               ingredients: ["Pizza dough", "Tomatoes", "Fresh mozzarella", "Basil", "Olive oil"],
               instructions: "Start by preheating your oven to its highest temperature. Roll out the pizza dough into your desired shape. Spread a thin layer of crushed tomatoes over the dough, leaving a border around the edges. Tear the fresh mozzarella into small pieces and distribute them evenly over the tomatoes. Sprinkle fresh basil leaves on top. Drizzle a bit of olive oil over the pizza. Bake the pizza on a preheated pizza stone or baking sheet until the crust is golden and the cheese is bubbly, about 10-12 minutes. Remove from the oven, let it cool slightly, and enjoy your homemade Margherita pizza.",
               imageName: "pizza-margarita"),
        
        Recipe(title: "Grilled Chicken Salad", headline: "Lunch", subheadline: "30 minute",
               ingredients: ["Chicken breasts", "Mixed greens", "Cherry tomatoes", "Cucumbers", "Balsamic vinaigrette"],
               instructions: "Start by grilling the chicken breasts until they are cooked through and have nice grill marks. While the chicken is cooking, prepare the salad by washing and drying the mixed greens, slicing the cherry tomatoes, and chopping the cucumbers. Once the chicken is done, let it rest for a few minutes before slicing it. In a large bowl, toss the greens, tomatoes, and cucumbers together. Place the sliced grilled chicken on top. Drizzle the balsamic vinaigrette over the salad. Toss everything together gently to combine. Your delicious and healthy grilled chicken salad is ready to be enjoyed!",
               imageName: "chicken-grilled"),
        
        
        Recipe(title: "Baked Salmon", headline: "Dinner",subheadline: "30 minute",
               ingredients: ["Salmon fillets", "Lemon", "Dill", "Garlic", "Olive oil"],
               instructions: "Preheat your oven to 375°F (190°C). Place the salmon fillets on a baking sheet lined with parchment paper. Drizzle olive oil over the fillets and rub them with minced garlic and chopped dill. Thinly slice the lemon and place lemon slices on top of the salmon. Season with salt and pepper. Bake the salmon in the preheated oven for about 12-15 minutes or until the salmon flakes easily with a fork. Serve the baked salmon with your favorite side dishes and enjoy a nutritious and flavorful dinner!",
               imageName: "salmon-fish"),
        
        Recipe(title: "Homestyle Beef Stew", headline: "Dinner",subheadline: "30 minute",
               ingredients: ["Beef stew meat", "Potatoes", "Carrots", "Onions", "Beef broth", "Thyme"],
               instructions: "Start by cutting the beef stew meat into bite-sized pieces and seasoning them with salt and pepper. Heat some oil in a large pot over medium-high heat. Brown the beef pieces on all sides, then remove them from the pot. In the same pot, add chopped onions and sauté until they're translucent. Add diced carrots and potatoes, and stir for a few minutes. Return the browned beef to the pot. Pour in enough beef broth to cover the ingredients. Add a few sprigs of thyme for flavor. Cover the pot and let the stew simmer on low heat for about 1.5 to 2 hours, or until the beef is tender and the flavors have melded together. Serve your hearty homestyle beef stew with crusty bread and savor the comforting flavors!",
               imageName: "Rendang"),
        
    ]
}
