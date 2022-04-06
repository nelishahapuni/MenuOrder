//
//  BurgerInfo.swift
//  MenuOrderAdvanced
//
//  Created by Neli Shahapuni on 4/6/22.
//

import SwiftUI

class BurgerViewModel : ObservableObject {
    
    @Published var burgerArray : [FoodModel] = []
    
    init() {
        getBurger()
    }
    
    func getBurger() {
        let hamburger = FoodModel(
            foodName: "Hamburger",
            foodDesc: "Original classic burger, with mouth-watering tender meat, tomatoes, fresh lettuce and soft buns.",
            imageName: "hamburger",
            foodPrice: 5.89,
            isVegan: false
        )
        let cheeseburger = FoodModel(
            foodName: "Cheeseburger",
            foodDesc: "Feverishly good cheeseburger, with mouth-watering amerian cheese grilled into tender meat, with tomatoes, fresh lettuce and soft buns.",
            imageName: "cheeseburger",
            foodPrice: 6.79,
            isVegan: false
        )
        let baconBurger = FoodModel(
            foodName: "Bacon Burger",
            foodDesc: "Rare bacon burger, with thin but crunchy bacon strips, tomatoes, fresh lettuce and soft buns.",
            imageName: "bacon_burger",
            foodPrice: 5.59,
            isVegan: false
        )
        let chickenBurger = FoodModel(
            foodName: "Chicken Burger",
            foodDesc: "Crunchy and light chicken burger, with deliciously tender chicken breast, tomatoes, fresh lettuce and soft buns.",
            imageName: "chicken_burger",
            foodPrice: 4.99,
            isVegan: false
        )
        let tripleBurger = FoodModel(
            foodName: "Triple Burger",
            foodDesc: "Original classic burger, with with TRIPLE meat, grilled to perfection, topped with tomatoes, fresh lettuce and soft buns.",
            imageName: "triple_burger",
            foodPrice: 8.69,
            isVegan: false
        )
        let onionBurger = FoodModel(
            foodName: "Onion Burger",
            foodDesc: "Sweet yet salty onion burger, with mouth-watering tender meat, tomatoes, fresh lettuce and soft buns.",
            imageName: "onion_burger",
            foodPrice: 7.29,
            isVegan: true
        )
        
        self.burgerArray.append(hamburger)
        self.burgerArray.append(cheeseburger)
        self.burgerArray.append(baconBurger)
        self.burgerArray.append(chickenBurger)
        self.burgerArray.append(tripleBurger)
        self.burgerArray.append(onionBurger)
        
    }
}

