//
//  ContentView.swift
//  Yumfinity
//
//  Created by Esad Dursun on 15.06.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 300)

//                AsyncImage(url: URL(string: "")) { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(height: 300)
//
//                } placeholder: {
//                    ProgressView()
//                }
                Spacer()
            }
            
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.8), radius: 30))
                    }
                    
                    Spacer()
                    Button() {
                        
                    } label: {
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.8), radius: 30))
                    }
                    
                }
                
                .padding()
                .padding()
                .padding(.top)
                Spacer()
                
                RecipeCard()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RecipeCard: View {
    @State private var selectedTab: String = "ingredients"
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Rectangle()
                .fill(Color.white)
                .frame(height: (UIScreen.main.bounds.height * 2) / 3)
                .shadow(color: Color.black.opacity(0.9), radius: 3)
                .cornerRadius(10, corners: [.topRight, .topLeft])
            
            VStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 60, height: 5)
                    .cornerRadius(10)
                HStack {
                    Text("Skirt Steak With Sauce")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    Image(systemName: "clock")
                    Text("30 min")
                }
                .foregroundColor(.secondary)
                .padding(.top, 4)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales nunc malesuada tempor scelerisque. Vestibulum a sagittis lorem.")
                    .padding(.top, 1)
                
                Grid(alignment: .topLeading) {
                    GridRow {
                        NutrientDetailCard(text1: "nutrient1", text2: "content")
                        NutrientDetailCard(text1: "nutrient2", text2: "content")
                    }
                    GridRow {
                        NutrientDetailCard(text1: "nutrient3", text2: "content")
                        NutrientDetailCard(text1: "nutrient4", text2: "content")
                    }
                }
                HStack(spacing: 0) {
                    Button {
                        self.selectedTab = "ingredients"
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(selectedTab == "ingredients" ? Color.black : Color.clear)
                            .frame(width: (UIScreen.main.bounds.width/2)-20, height: 50)
                            .overlay {
                                Text("Ingredients")
                                    .foregroundColor(selectedTab == "ingredients" ? Color.white : Color.black.opacity(0.5))
                                    .fontWeight(.bold)
                            }
                    }
                    
                    Button {
                        self.selectedTab = "instructions"
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(selectedTab == "instructions" ? Color.black : Color.clear)
                            .frame(width: (UIScreen.main.bounds.width/2)-20, height: 50)
                            .overlay {
                                Text("Instructions")
                                    .foregroundColor(selectedTab == "instructions" ? Color.white : Color.black.opacity(0.5))
                                    .fontWeight(.bold)
                            }
                    }
                    
                    
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.secondary.opacity(0.2))
                }
                
                if(selectedTab == "ingredients") {
                    ScrollView {
                        VStack {
                            ForEach(ingredients, id: \.self) { ingredient in
                                
                                HStack(alignment: .top) {
                                    Text("-")
                                    Text(ingredient)
                                        .fontWeight(.medium)
                                        .font(.subheadline)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .shadow(color: Color.black.opacity(0.3), radius: 3)
                                }
                            }
                        }
                        .padding(1)
                        .padding(.horizontal, 1)
                    }
                    .padding(.top)
                    .frame(maxWidth: .infinity)
                    .frame(height: 225)
                    .padding(.bottom)
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(instructions.indices, id: \.self) { index in
                                HStack(     alignment: .top) {
                                    Text("\(index + 1).")
                                        .bold()
                                    
                                    Text(instructions[index])
                                        .fontWeight(.medium)
                                        .font(.subheadline)
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .shadow(color: Color.black.opacity(0.3), radius: 3)
                                }
                            }
                        }
                        .padding(1)
                        .padding(.horizontal, 1)
                    }
                    .padding(.top)
                    .frame(maxWidth: .infinity)
                    .frame(height: 225)
                    .padding(.bottom)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
            .padding()
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

let ingredients: [String] = [
    "ingredient 1",
    "ingredient 2",
    "ingredient 3",
    "ingredient 4"
]

let instructions: [String] = [
    "instruction 1",
    "instruction 2",
    "instruction 3",
    "instruction 4"
]

struct NutrientDetailCard: View {
    var text1: String
    var text2: String
    var body: some View {
        HStack(spacing: 2) {
            Text(text1)
                .font(.title3)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow.opacity(0.7)))
            Text(text2)
                .foregroundColor(Color.black.opacity(0.7))
                .bold()
                .font(.headline)
        }
        .fontWeight(.medium)
        .foregroundColor(Color.black.opacity(0.9))
    }
}
