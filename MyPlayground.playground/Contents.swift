import UIKit
import Foundation
import Darwin.C.math


//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
var n: Float = 2.0
var m: Float = 3.0
var gipotenuza = sqrt(pow(n, 2) + pow(m, 2))

func S(){
    (n * m * 0.5)
}
func P(){
    (n + m + gipotenuza)
}
S()
P()


//Решить квадратное уравнение.
var a: Float = 2.0
var b: Float = 7.0
var c: Float = -3.0
var x1: Float = 0.0
var x2:  Float = 0.0
var D = pow(b, 2) - (4 * a * c)

func corniD() {
    if D == 0{
        -(b / (2 * a))
    } else if D > 0{
       x1 = (-b + sqrtf(D)) / (2 * a)
        x2 = (-b - sqrtf(D)) / (2 * a)
    } else if D < 0{
        print("Решений нет")
    }
}
corniD()


//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var summ: Float = 1000
var proc: Float = 10
var year: Int = 5
func vklad(){
    for i in 1 ... year {
        let newSumm = summ + (summ / proc)
        summ = newSumm
        print(summ)
        i
    }
print("Через", year, "лет будет", summ , "рублей")
}
vklad()


//var str = Array(readLine(strippingNewline: true)!.characters)

