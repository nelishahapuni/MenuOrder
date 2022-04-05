//
//  ContentView.swift
//  MenuOrderAdvanced
//
//  Created by Neli Shahapuni on 4/5/22.
//

import SwiftUI

struct FoodModel: Identifiable {
    let id : String = UUID().uuidString //this creates a new automatic random ID for each elem (no need to pass id below)
    let foodName : String
    let foodDesc : String
    let imageName : String
    let foodPrice : Double
    let isAvailable : Bool
}

struct ContentView: View {
    
    @State var burgersInfo : [FoodModel] = [
        FoodModel(foodName: "Hamburger", foodDesc: "Original classic burger, with mouth-watering tender meat, tomatoes, fresh lettuce and soft buns.", imageName: "hamburger", foodPrice: 5.89, isAvailable: true),
        FoodModel(foodName: "Cheeseburger", foodDesc: "Feverishly good cheeseburger, with mouth-watering amerian cheese grilled into tender meat, with tomatoes, fresh lettuce and soft buns.", imageName: "cheeseburger", foodPrice: 6.79, isAvailable: true),
        FoodModel(foodName: "Bacon Burger", foodDesc: "Rare bacon burger, with thin but crunchy bacon strips, tomatoes, fresh lettuce and soft buns.", imageName: "bacon_burger", foodPrice: 5.59, isAvailable: false),
        FoodModel(foodName: "Chicken Burger", foodDesc: "Crunchy and light chicken burger, with deliciously tender chicken breast, tomatoes, fresh lettuce and soft buns.", imageName: "chicken_burger", foodPrice: 4.99, isAvailable: true),
        FoodModel(foodName: "Triple Burger", foodDesc: "Original classic burger, with with TRIPLE meat, grilled to perfection, topped with tomatoes, fresh lettuce and soft buns.", imageName: "triple_burger", foodPrice: 8.69, isAvailable: false),
        FoodModel(foodName: "Onion Burger", foodDesc: "Sweet yet salty onion burger, with mouth-watering tender meat, tomatoes, fresh lettuce and soft buns.", imageName: "onion_burger", foodPrice: 7.29, isAvailable: true),
    ]
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        ZStack {
            (isAnimated ? Color(#colorLiteral(red: 0.9143522382, green: 0.8826459646, blue: 0.9681094289, alpha: 1)) : Color(#colorLiteral(red: 0.9489904046, green: 0.9217998385, blue: 0.7842540145, alpha: 1))).ignoresSafeArea()
                .animation(Animation
                            .easeIn)
            
            
            VStack {
                TabView{
                    ForEach(burgersInfo) { burger in
                        ShowFood(foodName: burger.foodName, foodDesc: burger.foodDesc, imageName: burger.imageName, foodPrice: burger.foodPrice, isAvailable: burger.isAvailable)
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onTapGesture(perform: {
                    isAnimated.toggle()
                })
                
                
            }
        }
    }
}

struct ShowFood : View {
    var foodName : String
    var foodDesc : String
    var imageName : String
    var foodPrice : Double
    var isAvailable : Bool
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 330)
                .padding()
            
            Text(foodName)
                .bold()
                .font(.title)
            
            Text(foodDesc)
                .font(.subheadline)
                .foregroundColor(Color(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)))
            
            Spacer()
            HStack {
                Text("- 1 +")
                
                Spacer()
                Text(String(format: "%.2f USD", (foodPrice)))
                    .font(.title2)
            }
            .padding()
            Spacer()
            Text("Add to cart")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.orange)
                .cornerRadius(30)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
