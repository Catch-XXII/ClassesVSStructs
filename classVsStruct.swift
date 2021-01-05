
//: Classes are  "Reference Type" and their reference are stored inside the "heap" section of memory
//: Copying a reference, implicitly creates a shared instance. After a copy, two variables then refer to a single instance of the data, so modifying data in the second variable also affects the original.
//: Memory management should be handled manually with allocationg and deallocating in low level programming languages such as c and c++
//: Classes are blueprint of an object
//: Heap for dynamic memory allocation
//: ARC does the job in apple devices. Reference count is tracked by the ARC and when it becomes zero, the object is deallocated.

print("---------------------------Class Starts Here---------------------------")
class Car {
    var brand: String
    var color: String
    init(brand: String, color: String) {
        self.brand = brand
        self.color = color
    }
}
var bmw = Car(brand: "BMW", color: "green")
var mercedes = bmw

print("Before the assignment")
print("BMW color: ", bmw.color)
print("Mercedes color: ", mercedes.color)

bmw.color = "blue"

print("After the assignment")
print("BMW color: ", bmw.color)
print("Mercedes color: ", mercedes.color)


//let toyota = Car(brand: "toyota", color: "black")
//let vw = toyota
//let renault = toyota
//vw = renault // Cannot assign to value: 'vw' is a 'let' constant
//vw.brand = renault.brand
//print(vw.brand) // toyota
//print(renault.brand) // toyota

print("---------------------------Class Ends Here---------------------------")

print("---------------------------Struct Starts Here---------------------------")
//: Structs are "Value Type" and they are stored inside the "stack" section of memory
//: Stack is a simple data structure with two principal operaitons Push and Pop
//: Stack is much faster than Heap
//: Stack is used for static memory allocation
//: Stack memory management is handled by CPU
//: Structures and protocols can only adopt protocols; they can't inherit from classes
//: Structs are thread-safe
//: Almost all primitive types and containers are struct such as (Int, Double, String, Array, Dictionary, Enum, Set, Tuple)
//: The stack is always reserved in a Last in First Out order (LIFO)

//if a struct variable is private, memberwise initiliazer will become private.
//struct Person{ private var name: String }
//let p1 = Person() //'Person' initializer is inaccessible due to 'private' protection level

struct Person {
    var name: String
    var age: Int
    /// All structures have an automatically generated memberwise initializer if their properties are not private
    /* You can still write init if you want to
     init(name:String, age: Int) {
         self.name = name
         self.age = age
     }
     */
}

var kane = Person(name: "Citizen Kane", age: 79)
var welles = kane

print("Before the assignment")
print("Person name: ", kane.name)
print("Person name: ", welles.name)

welles.name = "Orson Welles"

print("After the assignment")
print("Person name: ", kane.name)
print("Person name: ", welles.name)

print("---------------------------Struct Ends Here---------------------------")

print("---------------------------Class inside Struct---------------------------")
struct Persona {
    var name: String
    var age: Int
    var vehicle: Vehicle
    
    init(name: String, age: Int, vehicle: Vehicle) {
        self.name = name
        self.age = age
        self.vehicle = vehicle
    }
}

class Vehicle {
    var company: String
    var years: Int
    init(company: String, years: Int) {
        self.company = company
        self.years = years
    }
}

var p1 = Persona(name: "John Doe", age: 34, vehicle: Vehicle(company: "BMW", years: 1995))
var p2 = Persona(name: "Mesut Özil", age: 34, vehicle: Vehicle(company: "Mercedes", years: 2020))

p1 = p2

print(p1.vehicle.company) //Mercedes
print(p2.vehicle.company) //Mercedes

print("---------------------------Ends Here---------------------------")

print("---------------------------Struct inside Class---------------------------")
class Carr {
    var brand: String
    var color: String
    var owner: Owner
    init(brand: String, color: String, owner: Owner) {
        self.brand = brand
        self.color = color
        self.owner = owner
    }
}

struct Owner {
    var name: String
    var age: Int
    // remember memberwise initiliazer
}

var carWithPerson1 = Carr(brand: "VW", color: "red", owner: Owner(name: "John Doe", age: 34))
var carWithPerson2 = Carr(brand: "Alfa Romoe", color: "blue", owner: Owner(name: "Mesut Ozil", age: 34))

carWithPerson1 = carWithPerson2

print(carWithPerson1.owner.name) //Mesut Ozil
print(carWithPerson2.owner.name) //Mesut Ozil

print("---------------------------Ends Here---------------------------")


class Shape {
    func draw() {
        print("draw shape")
    }
}

class Square: Shape {
    override func draw() {
        print("square")
    }
}
class Circle: Shape {
    override func draw() {
        print("cirlce")
    }
}
class Triangle: Shape {
    override func draw() {
        print("triangle")
    }
}
class Rectangle: Shape {
    override func draw() {
        print("rectangle")
    }
}


protocol Drawable {
    func draw()
}

// I am not a shape but i need to draw a bow in a combat
class Archer: Drawable {
    func draw() {
        print("Archer is ready to draw a bow")
    }
}

struct Cavalry: Drawable {
    func draw() {
        print("I draw a bow on a horse")
    }
}
