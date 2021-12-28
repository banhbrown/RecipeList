//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by Brianna Brown on 12/27/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    // Reference the view model
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
