////
////  TestStruct.swift
////  MenuOrderBasic
////
////  Created by Neli Shahapuni on 3/13/22.
////
//
//import SwiftUI
//
//struct TestStruct: View {
//    
//    @State var currencyRate: Double = 1.0
//    let currencyRateOptions: [Double] = [1.0,1.1,1.96]
//    @State var currency: String = "EUR"
//    let currencyOptions: [String] = ["EUR","USD","BGN"]
//    
//    @State var soupAmount: Int = 0
//    var soupPrice: Double = 2.0
//    
//    @State var mainDishAmount: Int = 0
//    var mainDishPrice: Double = 4.5
//    
//    @State var dessertAmount: Int = 0
//    var dessertPrice: Double = 1.5
//    
//    var body: some View {
//        let currIndex = currencyRateOptions.firstIndex(of: currencyRate)!
//        VStack (spacing: 0){
//            
//            Section() {
//                Picker(selection: $currencyRate, label: Text("Currency"), content: {
//                    ForEach(currencyOptions.indices) { index in
//                        Text(currencyOptions[index])
//                            .tag(currencyRateOptions[index])
//                        
//                    }
//                })
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
//            }
//            VStack {
//                MealsSection(mealName: "Soup", currencyRate: currencyRate, currencyName: currencyOptions[currIndex], mealPrice: soupPrice, mealAmount: soupAmount)
//                    .padding()
//                MealsSection(mealName: "Main Dish", currencyRate: currencyRate, currencyName: currencyOptions[currIndex], mealPrice: mainDishPrice, mealAmount: mainDishAmount)
//                    .padding()
//                MealsSection(mealName: "Dessert", currencyRate: currencyRate, currencyName: currencyOptions[currIndex], mealPrice: dessertPrice, mealAmount: dessertAmount)
//                    .padding()
//            }
//            padding()
//        }
//    }
//}
//
//struct TestStruct_Previews: PreviewProvider {
//    static var previews: some View {
//        TestStruct()
//    }
//}
//
//struct MealsSection: View {
//    
//    var mealName: String
//    var currencyRate: Double
//    var currencyName: String
//    var mealPrice: Double
//    @State var mealAmount: Int
//    
//    var body: some View {
//        VStack(alignment: .leading,spacing: 0) {
//            Text(mealName)
//                .bold()
//            HStack{
//                Stepper(String(format: "%.2f ", (mealPrice*currencyRate)) + "\(currencyName)", value: $mealAmount, in: 0...10)
//                    .font(.subheadline)
//                Spacer()
//                Spacer()
//                Text("\(mealAmount)")
//                    .font(.subheadline)
//            }
//        }
//    }
//}
//

//old code

//-------
//                    VStack(alignment: .leading,spacing: 0){
//                        Text("Soup")
//                            .bold()
//                        HStack{
//                            Stepper(String(format: "%.2f ", (2.00*currencyRate)) + "\(currencyOptions[currIndex])", value: $soupAmount, in: 0...10)
//                                .font(.subheadline)
//                            Spacer()
//                            Spacer()
//                            Text("\(soupAmount)")
//                                .font(.subheadline)
//                        }
//                    }
//                    VStack(alignment: .leading,spacing: 0) {
//                        Text("Main Dish")
//                            .bold()
//                        HStack{
//                            Stepper(String(format: "%.2f ", (4.50*currencyRate)) + "\(currencyOptions[currIndex])", value: $mainDishAmount, in: 0...10)
//                                .font(.subheadline)
//                            Spacer()
//                            Spacer()
//                            Text("\(mainDishAmount)")
//                                .font(.subheadline)
//                        }
//                    }
//                    VStack(alignment: .leading,spacing: 0) {
//                        Text("Dessert")
//                            .bold()
//                        HStack{
//                            Stepper(String(format: "%.2f ", (1.50*currencyRate)) + "\(currencyOptions[currIndex])", value: $dessertAmount, in: 0...10)
//                                .font(.subheadline)
//                            Spacer()
//                            Spacer()
//                            Text("\(dessertAmount)")
//                                .font(.subheadline)
//                        }
//                    }
