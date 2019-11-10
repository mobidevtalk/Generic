//: [Index](Index)

import Foundation

protocol Energy{
    associatedtype EnergyBar
    
    func consume(unit: EnergyBar)
    func loss()
}

enum EnergyConsumption{
    case eat
    case radiation
}

struct Spinach{
    let consumptionType = EnergyConsumption.eat
    
    let iron = 2.71
    let magnesium = 79
    let calcium = 99
}

extension Spinach: CustomStringConvertible{
    var description: String{
        return "\(iron) mg, \(magnesium) mg, \(calcium) mg"
    }
}

struct Wavelengths{
    let name: String
    let start: Float
    let end: Float
}

extension Wavelengths: CustomStringConvertible{
    var description: String{
        return "\(name): \(start)-\(end)"
    }
}

struct SunRay{
    let consumptionType = EnergyConsumption.radiation
    
    let visibleWavelengths = Wavelengths(name: "visibleLight", start: 0.4, end: 0.8)
    let ultravioletWavelengths = Wavelengths(name: "ultravioletLight", start: 0.2, end: 0.3)
    let infraredWavelengths = Wavelengths(name: "infraredRadiation", start: 0.9, end: 1.0)
}

extension SunRay: CustomStringConvertible{
    var description: String{
        return "wavelengths[micrometre]\n\(visibleWavelengths.description)\n\(ultravioletWavelengths.description)\n\(infraredWavelengths.description)"
    }
}


struct Popeye: Energy{
    typealias EnergyBar = Spinach

    func consume(unit: Spinach) {
        "Energy is increased by \(unit.description)"
    }
    
    func loss() {
        "Energy lost"
    }
}

struct SuperMan: Energy{
    func consume(unit: SunRay) {
        unit.description
    }
    
    func loss() {
        "SuperMan in now a human"
    }
}

let popeye = Popeye()
popeye.consume(unit: Spinach())

let superMan = SuperMan()
superMan.consume(unit: SunRay())
