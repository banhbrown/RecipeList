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
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView {
                    
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count) { index in
                        
                        // Only show those that hsould be featured
                        if model.recipes[index].featured == true {
                            
                            // Recipe Card Button
                            Button(action:{
                                
                                // Show the recipiee detail sheet
                                self.isDetailViewShowing = true
                                
                            }, label: {
                            
                                //Recipe Card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                    
                                    VStack (spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            })
                                .sheet(isPresented: $isDetailViewShowing, content: {
                                    // Show the RecipeDetailView
                                    RecipeDetailView(recipe: model.recipes[index])
                                })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0,opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy,Hearty")
            }
            .padding(.vertical)
            
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
