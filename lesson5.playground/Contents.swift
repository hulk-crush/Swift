/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести сами объекты в консоль.
*/

protocol Car{
    func canDrive() -> Bool
}

class SportCar: Car {
    var wheels: Int
    var stateEngine: Bool
    var brand: String
    
    init(wheels: Int, stateEngine: Bool, brand: String) {
        self.wheels = wheels
        self.stateEngine = stateEngine
        self.brand = brand
    }
    
    func canDrive() -> Bool {
        if wheels != 4{
            print("U have wrong number of wheels")
            return false
        } else {
            print("U can go! LETS GO!")
            return true
        }
    }
}

class Truck: Car {
    var maxFillTrunk: Int
    var fillTrunk: Int
    
    init(maxFillTrunk: Int, fillTrunk: Int) {
        self.fillTrunk = fillTrunk
        self.maxFillTrunk = maxFillTrunk
    }
    func differenceFill(){
        var dif = maxFillTrunk - fillTrunk
        print ("U havent \(dif) kg. luggage")
    }
    
    func canDrive() -> Bool {
        if fillTrunk <= maxFillTrunk {
            print("U can drive")
            return true
        } else {
            print("Ur luggage too big")
            return false
        }
    }
}

extension SportCar{
    func doesWorkCar() -> Bool {
        if stateEngine == true{
            print("Car is worked")
            return true
        } else {
            print("Turn on engine!")
            return false
        }
    }
}

extension SportCar: CustomStringConvertible{
    var description: String {
        return String(describing: brand)
    }
}


let car1 = SportCar(wheels: 4, stateEngine: true, brand: "BMW")
let car2 = SportCar(wheels: 3, stateEngine: false, brand: "LADA")
car1.canDrive()
car1.stateEngine
car1.brand
car1.wheels
car2.brand
car2.stateEngine
car2.doesWorkCar()



let truck1 = Truck(maxFillTrunk: 250, fillTrunk: 180)
let truck2 = Truck(maxFillTrunk: 150, fillTrunk: 200)
truck1.differenceFill()
truck1.canDrive()
truck2.canDrive()

