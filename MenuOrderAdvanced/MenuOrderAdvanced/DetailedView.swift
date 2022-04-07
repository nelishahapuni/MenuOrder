//
//  DetailedView.swift
//  MenuOrderAdvanced
//
//  Created by Neli Shahapuni on 4/5/22.
//

import SwiftUI

struct DetailedView: View {
    
    
    //NOTE TO SELF: Use the index of the tab view to access the specific burger
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var burgerViewModel: BurgerViewModel = BurgerViewModel()
    
    @State var selectedFoodTag : Int = 1
    
    @State var selectedFood: String
    var foodName : String
    var foodDesc : String
    var imageName : String
    var foodPrice : Double
    var isVegan : Bool
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9489904046, green: 0.9217998385, blue: 0.7842540145, alpha: 1)).ignoresSafeArea()
            
            VStack {
                
                TabView(selection: $selectedFoodTag,
                        content:  {
                            ForEach(burgerViewModel.burgerArray) { burger in
                                VStack{//delete this vstack later
                                    ShowFood(foodName: foodName, foodDesc: foodDesc, imageName: imageName, foodPrice: foodPrice, isVegan: isVegan)
                                }
                                .tag(getIndex(name: selectedFood))
                            }
                        })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }
    
    func getIndex(name: String) -> Int {
        for i in 0..<burgerViewModel.burgerArray.count {
            if burgerViewModel.burgerArray[i].imageName == name {
                return i
            }
        }
        return 0
    }
}

struct ShowFood : View {
    var foodName : String
    var foodDesc : String
    var imageName : String
    var foodPrice : Double
    var isVegan : Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.size.width*0.8, height: UIScreen.main.bounds.size.height*0.3)
                .padding()
            HStack{
                Text(foodName)
                    .bold()
                    .font(.title)
                
                if isVegan {
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.blue)
                }
            }
            Text(foodDesc)
                .font(.subheadline)
                .foregroundColor(Color.gray)
            
            Divider()
            
            HStack {
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.gray)
                            .font(.title)
                    })
                    Text("1")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.black)
                            .font(.title)
                    })
                }
                .padding(10)
                .background(Capsule().stroke(Color.gray, lineWidth: 3.0))
                .cornerRadius(30)
                Spacer()
                Text(String(format: "%.2f USD", (foodPrice)))
                    .font(.largeTitle)
                    .bold()
            }
            .padding()
            Text("Add to cart")
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.orange)
                .cornerRadius(30)
            
            Spacer()
        }
        .padding().padding().padding()
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
