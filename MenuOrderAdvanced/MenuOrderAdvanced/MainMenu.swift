//
//  MainMenu.swift
//  MenuOrderAdvanced
//
//  Created by Neli Shahapuni on 4/6/22.
//

import SwiftUI

//MARK: FOOD MODEL

struct FoodModel: Identifiable {
    let id : String = UUID().uuidString 
    let foodName : String
    let foodDesc : String
    let imageName : String
    let foodPrice : Double
    let isVegan : Bool
}

//MARK: MAIN MENU

struct MainMenu: View {
    
    @StateObject private var burgerViewModel: BurgerViewModel = BurgerViewModel()
    
    let columnsInfo: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                ScrollView{
                    LazyVGrid(
                        columns: columnsInfo,
                        alignment: .center,
                        spacing: nil,
                        pinnedViews: [],
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
                                    
                                    NavigationLink(
                                        destination: DetailedView (foodName: burger.foodName, foodDesc: burger.foodDesc, imageName: burger.imageName, foodPrice: burger.foodPrice, isVegan: burger.isVegan),
                                        label: {
                                            FoodThumbnail(foodName: burger.foodName, foodDesc: burger.foodDesc, imageName: burger.imageName, foodPrice: burger.foodPrice, isVegan: burger.isVegan)
                                        })
                                }
                            }
                        })
                        .padding()
                }
            }
            .navigationTitle("Main Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//MARK: FOOD THUMBNAIL

struct FoodThumbnail: View {
    
    var foodName : String
    var foodDesc : String
    var imageName : String
    var foodPrice : Double
    var isVegan : Bool
    
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
                        .foregroundColor(.black)
                        .bold()
                        .font(.title3)
                    
                    if isVegan {
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
        .shadow(color: .red.opacity(0.3), radius: 5, x: 10, y:10)
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
