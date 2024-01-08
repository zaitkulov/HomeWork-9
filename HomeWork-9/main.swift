//
//  main.swift
//  HomeWork-9
//
//  Created by Артем Заиткулов on 08.01.2024.
//

import Foundation

// Задание: Работа с иерархией животных и управление циклом удержания

protocol Animal: AnyObject {
    var name: String { get }
    var sound: String { get }
    func makeSound()
}
class Dog: Animal {
    var name: String
    var sound: String
    init(name: String) {
        self.name = name
        self.sound = "Woof!"
    }
    func makeSound() {
        print("\(name) says \(sound)")

    }
    deinit {
        print ("Dog \(name) is being deallocated")
    }
}

class Cat: Animal {
    var name: String
    var sound: String
    init(name: String) {
        self.name = name
        self.sound = "Meow!"
    }
    func makeSound() {
        print ("\(name) says \(sound)")
    }
    deinit {
        print ("Cat \(name) is being deallocated")
    }
}
class RetainCycleExample {
    weak var weakDog: Dog?
    weak var weakCat: Cat?
    
    init() {
        let dog = Dog(name: "Jack")
        let cat = Cat(name: "Markiz")
        weakDog = dog
        weakCat = cat
        print("RetainCycleExample is initialized")
    }
    deinit {
        print ("RetainCycleExample is being deallocated")
    }
}
func example() {
    var example: RetainCycleExample? = RetainCycleExample()
    example?.weakDog?.makeSound()
    example?.weakCat?.makeSound()
    example = nil
}
example()

