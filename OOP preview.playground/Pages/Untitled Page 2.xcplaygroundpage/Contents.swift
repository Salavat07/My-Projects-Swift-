//: [Previous](@previous)

import Foundation

class Transport {
    var name: String
    var maxSpeed: Int
 
    init(name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
 
    func printName() {
        print(self.name)
    }
}
 
protocol HasPowerReserve {
    var powerReserve: Double {get }
}
 
class Car: Transport, HasPowerReserve {
    var fuelInTank: Int
    var fuelConsumption: Double
 
    var powerReserve: Double {
        Double(fuelInTank) / fuelConsumption * 100
    }
 
    init(maxSpeed: Int, fuelInTank: Int, fuelConsumption: Double) {
        self.fuelInTank = fuelInTank
        self.fuelConsumption = fuelConsumption
        super.init(name:"Car", maxSpeed: maxSpeed)
    }
}
 
let car2 = Car(maxSpeed: 250, fuelInTank: 80, fuelConsumption: 10.5)
car2.printName()
print(car2.powerReserve)
 
 
 
class ElectricScooter: Transport, HasPowerReserve {
    var chargeLevel: Double
    var maxDistance: Double
 
    var poweReserve: Double {
        maxDistance * chargeLevel
    }
 
    init(maxSpeed: Int, chargeLevel: Double, maxDistance: Double) {
        self.chargeLevel = chargeLevel
        self.maxDistance = maxDistance
        super.init(name: "ElectricScooter", maxSpeed: maxSpeed)
    }
}
 
var transports: [HasPowerReserve] = [
    Car(maxSpeed: 250, fuelTank: 100, fuelConsumption: 20,
        ElectricScooter(maxSpeed: 25, chargeLevel: 0.7, maxDistance: 30) ]

 
for transport in transports {
    print(transport.powerReverse)
}
 
