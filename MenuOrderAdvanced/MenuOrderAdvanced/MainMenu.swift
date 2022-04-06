//
//  MainMenu.swift
//  MenuOrderAdvanced
//
//  Created by Neli Shahapuni on 4/6/22.
//

import SwiftUI

struct MainMenu: View {
    
    @StateObject private var burgerViewModel: BurgerViewModel = BurgerViewModel()
    
    let columnsInfo: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        
    ]
    
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            ScrollView{
                LazyVGrid(
                    columns: columnsInfo,
                    alignment: .center,
                    spacing: nil,
                    pinnedViews: [.sectionHeaders],
                    content: {
                        Section(header:
                                    Text("Burgers")
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .background(Color.white)
                                    .font(.title)
                                    .foregroundColor(.orange)
                                    .cornerRadius(30)
                        ) {
                            ForEach(burgerViewModel.burgerArray) { burger in
                                FoodThumbnail(foodName: burger.foodName, foodDesc: burger.foodDesc, imageName: burger.imageName, foodPrice: burger.foodPrice, isAvailable: burger.isVegan)
                            }
                        }
                        
                        
                    })
                    .padding()
            }
            
        }
    }
}

struct FoodThumbnail: View {
    
    var foodName : String
    var foodDesc : String
    var imageName : String
    var foodPrice : Double
    var isAvailable : Bool
    
    var body: some View {
        VStack{
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.size.width*0.33, height: UIScreen.main.bounds.size.height*0.15)
                .padding()
            VStack{
                HStack{
                    Text(foodName)
                        .bold()
                        .font(.title3)
                    
                    if isAvailable {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                    }
                }
                Text(String(format: "$%.2f", (foodPrice)))
                    .font(.title2)
                    .foregroundColor(.orange)
            }
            Spacer()
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
