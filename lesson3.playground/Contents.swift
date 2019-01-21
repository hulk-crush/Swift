import UIKit
/*
1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/

enum engineState {
    case start, stop
}

enum AreWindowsOpen {
    case open, close
}

enum trunkState {
    case full, empty
}

struct car {
    let brandAuto : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "gray":
            self.color = "gray"
        case "blue":
            self.color = "blue"
        default:
            print("Input error.")
        }
    }
    let yearOfManufacture : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brandAuto) trunk free: \(space)")
            } else { print("Input error or \(brandAuto) trunk is full.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brandAuto) engine is on")
            } else {print("\(brandAuto) engine is off")}
        }
    }
    var AreWindowsOpen : AreWindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandAuto) windows are open")
            } else { print("\(brandAuto) windows are close") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brandAuto) trunck is empty")
    }
}

struct truck {
    let brandTruck : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "red":
            self.color = "red"
        case "blue":
            self.color = "blue"
        default:
            print("Input error.")
        }
    }
    let yearOfManufacture : Int
    var truckVolume : Double {
        willSet {
            if (trunkState == .empty) && (truckVolume > 0) && (truckVolume != 0) && (newValue < truckVolume) {
                let space = truckVolume - newValue
                print ("\(brandTruck) trunk free: \(space)")
            } else { print("Input error or \(brandTruck) trunk is full.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brandTruck) engine is on")
            } else {print("\(brandTruck) engine is off")}
        }
    }
    var AreWindowsOpen : AreWindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandTruck) windows are open")
            } else { print("\(brandTruck) windows are close") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brandTruck) trunck is empty")
    }
}

var car1 = car(brandAuto: "BMW",  color: "clear", yearOfManufacture: 2016, trunkVolume: 580.0 , engineState: .stop, AreWindowsOpen: .open, trunkState: .empty)
var car2 = car(brandAuto: "Kia",  color: "clear", yearOfManufacture: 2017, trunkVolume: 480.0, engineState: .stop, AreWindowsOpen: .close, trunkState: .full)

var truck1 = truck(brandTruck: "Mercedes",  color: "clear", yearOfManufacture: 2012, truckVolume: 100000.0, engineState: .start, AreWindowsOpen: .open, trunkState: .full)
var truck2 = truck(brandTruck: "Chevrolet",  color: "clear", yearOfManufacture: 2013, truckVolume: 150000.0, engineState: .start, AreWindowsOpen: .close, trunkState: .empty)


car1.engineState = .start
car1.trunkVolume = 340.0
car1.changeColor(c: "red")
car2.trunkVolume = 890.0
car2.emptyTrunck()
car2.trunkVolume = 80.9
car2.AreWindowsOpen = .open
car2.changeColor(c: "black")

truck1.engineState = .stop
truck1.AreWindowsOpen = .close
truck2.AreWindowsOpen = .open
truck2.engineState = .stop
truck2.truckVolume = 5678908
truck2.changeColor(c: "white")
truck2.color
