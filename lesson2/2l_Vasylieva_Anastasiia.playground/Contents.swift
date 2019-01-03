import UIKit
//1. Написать функцию, которая определяет, четное число или нет.
var a = 5
func even() {
    if a % 2 == 0{
        print(a, "is even number")
    } else{
        print(a, "is odd number")
    }
}
even()
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
var b = 3
func multiple3() {
    if b % 3 == 0{
        print(b, "is multiple 3")
    } else{
        print(b, "is not multiple 3")
    }
}
multiple3()
//3. Создать возрастающий массив из 100 чисел.

var arr: [Int] = []
for i in 1...100{
    arr.append(i)
}
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

//var filtred = arr.filter({$0 % 2 != 0 && $0 % 3 != 0 })
//arr = filtred
//print(arr)
for n in arr where (n % 2 == 0) || (n % 3 == 0) {
    arr.remove(at : (arr.index(of: n)!))
}
 print(arr)
//5. *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func fibonacci (n: Int) -> (Decimal) {
    if (n < 3) {
        return 1
    } else {
        var z1: Decimal = 1, z2: Decimal = 1, z: Decimal
        for _ in 3...n {
            z = z1 + z2
            z1 = z2
            z2 = z
        }
        return z2
    }
}
var fibArray = [Decimal]()
fibArray.append(0)
var n  = 50
for i in 1...n {
    fibArray.append(fibonacci(n: i))
}
print(fibArray)
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.
func Simple (num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}
func SimpleArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if Simple(num: i) {
            results.append(i)
        }
        i += 1
    }
    
    return results
}
print (SimpleArray())
