/*
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/

enum FlowerColor {
    case red, white, purple, blue, black
}

protocol SizeBouquet{
    var numberOfFlower: Int { get set}
    
}

struct Flower: SizeBouquet {
    var color: FlowerColor
    var numberOfFlower: Int
}

extension Flower: CustomStringConvertible{
    var description: String {
        return "In bouquet \(numberOfFlower)  \(color) flowers"
    }
}
   

struct Queue<T: SizeBouquet> {
    private var elements: [T] = []

    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue()->T? {
        return elements.removeLast()
    }
    
    var sizeOfBouquet : Int{
        var numberOfFlower = 0
        for element in elements {
            numberOfFlower += element.numberOfFlower
        }
        return numberOfFlower
    }
    subscript (elements: Int ...) -> Int{
        var numberOfFlower = 0
        for index in elements where index < self.elements.count {
            numberOfFlower += self.elements[index].numberOfFlower
        }
        return numberOfFlower
    }

}

extension Queue{
    func filtred(predicate: (T) -> Bool) -> [T] {
        var myArr = [T]()
        for elem in elements {
            if predicate(elem){
                myArr.append(elem)
            }
        }
        return myArr
    }
}


var bouquetFlower = Queue<Flower>()

bouquetFlower.enqueue(element: Flower(color: .black, numberOfFlower: 15))
bouquetFlower.enqueue(element: Flower(color: .red, numberOfFlower: 10))
bouquetFlower.enqueue(element: Flower(color: .white, numberOfFlower: 3))
bouquetFlower.enqueue(element: Flower(color: .blue, numberOfFlower: 6))


bouquetFlower[0, 1, 2, 3]
let bigBouquet = bouquetFlower.filtred(predicate: {$0.numberOfFlower > 8})
print(bigBouquet)
