//
//  Triangle.swift
//  areaСalculation
//
//  Created by Илья Акулов on 13.02.2024.
//

import Foundation

// Класс для треугольника
class Triangle: Figure {
    let sideA: Double
    let sideB: Double
    let sideC: Double
    
    init(sideA: Double, sideB: Double, sideC: Double) {
        self.sideA = sideA
        self.sideB = sideB
        self.sideC = sideC
    }
    
    func getArea() -> Double {
        let s = (sideA + sideB + sideC) / 2
        return sqrt(s * (s - sideA) * (s - sideB) * (s - sideC))
    }
    
    func isRightTriangle() -> Bool {
        let sides = [sideA, sideB, sideC].sorted()
        return pow(sides[0], 2) + pow(sides[1], 2) == pow(sides[2], 2)
    }
}
