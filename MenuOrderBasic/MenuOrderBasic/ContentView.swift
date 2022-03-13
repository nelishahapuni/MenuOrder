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
    let currencyRateOptions: [Double] = [1.0,1.1,1.96]
    @State var currency: String = "EUR"
    let currencyOptions: [String] = ["EUR","USD","BGN"]
    
    //Meal amount & prices
    @State var soupAmount: Int = 0
    var soupPrice: Double = 2.0
    
    @State var mainDishAmount: Int = 0
    var mainDishPrice: Double = 4.5
    
    @State var dessertAmount: Int = 0
    var dessertPrice: Double = 1.5
    
    //drinks slider
    @State var cokeAmount: Double = 0.0
    
    //toggle state
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        let currIndex = currencyRateOptions.firstIndex(of: currencyRate)!
        let totalMealPrice: Double = Double(soupAmount) * soupPrice + Double(mainDishAmount) * mainDishPrice + Double(dessertAmount) * dessertPrice
        let totalCokePrice: Double = cokeAmount * 2
        let deliveryPrice: Int = 10
        let totalPrice = totalMealPrice + totalCokePrice
        
        NavigationView {
            Form {
                Section(header: Text("Currency")) {
                    Picker(selection: $currencyRate, label: Text("Currency"), content: {
                        ForEach(currencyOptions.indices) { index in
                            Text(currencyOptions[index])
                                .tag(currencyRateOptions[index])
                            
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                
                Section(header: Text("Meals")){
                    VStack(alignment: .leading,spacing: 0){
                        Text("Soup")
                            .bold()
                        HStack{
                            Stepper(String(format: "%.2f ", (2.00*currencyRate)) + "\(currencyOptions[currIndex])", value: $soupAmount, in: 0...10)
                                .font(.subheadline)
                            Spacer()
                            Spacer()
                            Text("\(soupAmount)")
                                .font(.subheadline)
                        }
                    }
                    VStack(alignment: .leading,spacing: 0) {
                        Text("Main Dish")
                            .bold()
                        HStack{
                            Stepper(String(format: "%.2f ", (4.50*currencyRate)) + "\(currencyOptions[currIndex])", value: $mainDishAmount, in: 0...10)
                                .font(.subheadline)
                            Spacer()
                            Spacer()
                            Text("\(mainDishAmount)")
                                .font(.subheadline)
                        }
                    }
                    VStack(alignment: .leading,spacing: 0) {
                        Text("Dessert")
                            .bold()
                        HStack{
                            Stepper(String(format: "%.2f ", (1.50*currencyRate)) + "\(currencyOptions[currIndex])", value: $dessertAmount, in: 0...10)
                                .font(.subheadline)
                            Spacer()
                            Spacer()
                            Text("\(dessertAmount)")
                                .font(.subheadline)
                        }
                    }
                }
                
                Section(header: Text("Drinks")){
                    VStack(alignment: .leading,spacing: 0){
                        Text("Coca Cola")
                            .bold()
                        HStack{
                            Text(String(format: "%.2f ", (2*currencyRate)) + "\(currencyOptions[currIndex])/Litre")
                            Slider(value: $cokeAmount, in: 0...2, step: 0.1, minimumValueLabel: Text(""), maximumValueLabel: Text(String(format: "%.2fL", cokeAmount)), label: {
                                Text("coke")
                            })
                        }
                        .font(.subheadline)
                    }
                }
                Section(header: Text("Order")) {
                    VStack(alignment: .leading, spacing: 0){
                        Text("Home Delivery")
                            .bold()
                        Toggle(
                            isOn: $toggleIsOn,
                            label: {
                                
                                Text(String(format: "%.2f ", (10*currencyRate)) + "\(currencyOptions[currIndex])")
                                    .font(.subheadline)
                            })
                            .toggleStyle(SwitchToggleStyle(tint: .yellow))
                    }
                }
                Section(header: Text("Price")){
                    
                    HStack{
                        VStack(alignment: .leading) {
                            
                            HStack{
                                Text("Total")
                                Spacer()
                                Text(toggleIsOn ? String(format: "%.2f ", (totalPrice + Double(deliveryPrice)) * currencyRate) + currencyOptions[currIndex] : String(format: "%.2f ", totalPrice * currencyRate) + currencyOptions[currIndex])
                                    .font(.subheadline)
                                    .bold()
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
