//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Brianna Brown on 12/26/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
}
