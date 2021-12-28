//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Brianna Brown on 12/26/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + item.name)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            
            }.navigationBarTitle(recipe.name)
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view os that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
