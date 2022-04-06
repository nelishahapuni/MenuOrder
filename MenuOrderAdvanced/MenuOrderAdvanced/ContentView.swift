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
    
    @StateObject var burgerViewModel: BurgerViewModel = BurgerViewModel()
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9489904046, green: 0.9217998385, blue: 0.7842540145, alpha: 1)).ignoresSafeArea()
            
            VStack {
                TabView{
                    ForEach(burgerViewModel.burgerArray) { burger in
                        ShowFood(foodName: burger.foodName, foodDesc: burger.foodDesc, imageName: burger.imageName, foodPrice: burger.foodPrice, isAvailable: burger.isAvailable)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
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
