//
//  ContentView.swift
//  MenuOrderBasic
//
//  Created by Neli Shahapuni on 3/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var soupAmount: Int = 0
    private var soupPrice: Double = 2.0
    
    @State private var mainDishAmount: Int = 0
    private var mainDishPrice: Double = 4.5
    
    @State private var dessertAmount: Int = 0
    private var dessertPrice: Double = 1.5
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Items")){
                    Stepper("Soup: 2.00 EUR", value: $soupAmount, in: 0...10)
                    Stepper("Main Dish: 4.50 EUR", value: $mainDishAmount, in: 0...10)
                    Stepper("Dessert: 1.50 EUR", value: $dessertAmount, in: 0...10)
                }
                Section(header: Text("Price")){
                    HStack{
                            Text("Total:")
                            Text("\(Double(soupAmount) * soupPrice + Double(mainDishAmount) * mainDishPrice + Double(dessertAmount) * dessertPrice)")
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
