//
//  ContentView.swift
//  MenuOrderBasic
//
//  Created by Neli Shahapuni on 3/12/22.
//

import SwiftUI

struct ContentView: View {
    //picker: the currencyRate on the picker is being updated in this var
    @State var currencyRate: Double = 1.0
    
    //Meal amount & prices
    @State private var soupAmount: Int = 0
    private var soupPrice: Double = 2.0
    
    @State private var mainDishAmount: Int = 0
    private var mainDishPrice: Double = 4.5
    
    @State private var dessertAmount: Int = 0
    private var dessertPrice: Double = 1.5
    
    //drinks slider
    @State var cokeAmount: Double = 0.0
    
    //toggle state
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Currency")) {
                    Picker(selection: $currencyRate, label: Text("Currency"), content: {
                        Text("EUR").tag(1.0)
                        Text("USD").tag(1.1)
                        Text("BGN").tag(1.96)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                
                Section(header: Text("Meals")){
                    Stepper("Soup: 2.00 EUR", value: $soupAmount, in: 0...10)
                    Stepper("Main Dish: 4.50 EUR", value: $mainDishAmount, in: 0...10)
                    Stepper("Dessert: 1.50 EUR", value: $dessertAmount, in: 0...10)
                }
                
                Section(header: Text("Drinks")){
                    HStack{
                        Text("Coke: 2EUR/Liter ")
                        //Slider(value: $cokeValue, in: 0...2, step: 1.0)
                        Slider(value: $cokeAmount, in: 0...2, step: 0.1, minimumValueLabel: Text(""), maximumValueLabel: Text(String(format: "%.2f", cokeAmount)), label: {
                            Text("coke")
                        })
                        .accentColor(.red)
                    }
                }
                Section(header: Text("Order")) {
                    Toggle(
                        isOn: $toggleIsOn,
                        label: {
                            Text("Home Delivery")
                        })
                        .toggleStyle(SwitchToggleStyle(tint: .yellow))
                }
                Section(header: Text("Price")){
                    
                    let totalMealPrice: Double = Double(soupAmount) * soupPrice + Double(mainDishAmount) * mainDishPrice + Double(dessertAmount) * dessertPrice
                    let totalCokePrice: Double = cokeAmount * 2
                    let deliveryPrice: Int = 10
                    let totalPrice = totalMealPrice + totalCokePrice
                    
                    HStack{
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Meal:")
                                Text(String(format: "%.2f", totalMealPrice * currencyRate))
                            }
                            HStack{
                                Text("Coke:")
                                Text(String(format: "%.2f", totalCokePrice * currencyRate))
                            }
                            HStack{
                                Text("Total:")
                                Text(toggleIsOn ? String(format: "%.2f", (totalPrice + Double(deliveryPrice)) * currencyRate) : String(format: "%.2f", totalPrice * currencyRate))
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Menu Order")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
