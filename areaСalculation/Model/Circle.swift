//
//  Circle.swift
//  areaСalculation
//
//  Created by Илья Акулов on 12.02.2024.
//
import Foundation

// Класс для круга
class Circle: Figure {
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func getArea() -> Double {
        return Double.pi * pow(radius, 2)
    }
}
