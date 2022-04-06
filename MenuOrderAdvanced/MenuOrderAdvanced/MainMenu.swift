//
//  MainMenu.swift
//  MenuOrderAdvanced
//
//  Created by Neli Shahapuni on 4/6/22.
//

import SwiftUI

struct MainMenu: View {
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.orange.ignoresSafeArea()
                
//                LazyVGrid(columns: [GridItem(.fixed(150))]) {
//                    ForEach((0...250), id: \.self) { _ in
//                        ColorView()
//                    }
//                }
                
//                ScrollView{
//                    HStack{
//                        Spacer()
//                        FoodThumbnail(imageName: "hamburger")
//                        FoodThumbnail(imageName: "cheeseburger")
//                        Spacer()
//                    }
//                    HStack{
//                        Spacer()
//                        FoodThumbnail(imageName: "bacon_burger")
//                        FoodThumbnail(imageName: "chicken_burger")
//                        Spacer()
//                    }
//                    HStack{
//                        Spacer()
//                        FoodThumbnail(imageName: "triple_burger")
//                        FoodThumbnail(imageName: "onion_burger")
//                        Spacer()
//                    }
//
//                }
                
            }
            //.scaledToFill()
            .navigationTitle("Main Menu")
        }
    }
}

struct FoodThumbnail: View {
    
    var imageName : String
    
    var body: some View {
        VStack{
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.size.width*0.33, height: UIScreen.main.bounds.size.height*0.15)
                .padding(.horizontal)
            VStack{
                Text("Burger")
                    .bold()
                    .font(.title)
                    Text("$5.67")
                        .font(.title2)
                        .foregroundColor(.orange)
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(10)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(color: .red.opacity(0.4), radius: 5, x: 3, y: 3)
                    })
            }
            .padding()
            
        }
        .background(Color.white.opacity(0.9))
        .cornerRadius(20)
        .padding(5)
        .shadow(color: .red.opacity(0.4), radius: 5, x: 10, y:10)
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
