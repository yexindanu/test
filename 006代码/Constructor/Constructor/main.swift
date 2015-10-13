//
//  main.swift
//  Constructor
//
//  Created by CarolWang on 15/4/15.
//  Copyright (c) 2015年 com.jikexueyuan. All rights reserved.
//

import Foundation
/*构造器的外部形参名*/
struct FkPoint
    {
    var left: Int = 0
    var top: Int = 0
    //定义带两个参数的构造器，并为第二个构造器参数显式指定外部形参名
    init(left: Int , y top: Int)
{
    self.left = left
    self.top = top
    }
}
// 第一个形参的外部形参名与局部形参名相同
// 第二个形参的外部形参名使用显式指定的形参名
var p1 = FkPoint(left:20 , y:12)



/*取消构造器的外部形参名*/
class Person
    {
    var name: String?
    var gender: String?
    var age = 0
    // 由于该类中前2个实例存储属性使用了可选类型，后1个实例存储属性指定了初始值，
    // 因此该结构体对构造器没有要求，故此处可随便定义一个带参数的构造器
    // 取消构造器参数的外部形参名
    init(_ name:String , _ gender:String)
{
    self.name = name
    self.gender = gender
    }
}
// 调用构造器时无需使用外部形参名
var p = Person("孙悟空" , "男")
println(p.name)
println(p.gender)
println(p.age)





/*在构造过程中常量属性是可以修改的*/
//class User
//    {
//    let maxAge = 100
//    var name: String
//    init(maxAge: Int , name :String) {
//      println(self.maxAge)
//      self.maxAge = Int.max
//      println(self.maxAge)
//      self.name = name
//      self.maxAge = maxAge
//    }
//}
//var u = User(maxAge:120 , name:"白骨精")
//println(u.maxAge)
//println(u.name)




/*使用闭包或函数为属性设置初始值*/
//struct ClosureInit {
//    // 使用闭包对test实例存储属性执行初始化
//    var test: Int = {
//    var dt = NSDate()
//    var gregorian = NSCalendar.currentCalendar()
//    // 定义一个时间字段的旗标，指定将会获取指定月、日信息
//    var unitFlags = NSCalendarUnit.CalendarUnitMonth
//    | NSCalendarUnit.CalendarUnitDay
//    var comp = gregorian.components(unitFlags
//    , fromDate:dt)
//    // 获取当前的月份
//    var month = Int(comp.month)
//    // 获取当前第几日
//    var day = Int(comp.day)
//    // 得到计算结果
//    return day - month
//    }()
//}
//var ci = ClosureInit()
//println(ci.test)








/*值类型的构造器重载*/
//struct ConstructorOverload {
//    var name: String!
//    var amount: Int!
//    // 提供无参数的构造器
//    init(){ }
//    // 提供带两个参数的构造器来完成构造过程
//    init(name: String, amount: Int)
//{
//    self.name = name
//    self.amount = amount
//    }
//}
//// 通过无参数构造器创建ConstructorOverload实例
//var oc1 = ConstructorOverload()
//// 通过有参数构造器创建ConstructorOverload实例
//var oc2 = ConstructorOverload(
//    name:"HelloWorld",amount:800000)
//println("\(oc1.name)  \(oc1.amount)")
//println("\(oc2.name)  \(oc2.amount)")












/*构造器代理：在定义构造器时，通过self.init(实参)调用其他构造器来完成实例的部分构造过程*/
//struct Apple
//    {
//    var name: String
//    var color: String
//    var weight: Double!
//    init(_ name: String , _ color:String)
//{
//    self.name = name
//    self.color = color
//    }
//// 两个参数的构造器
//    init(name: String , color:String)
//{
//    self.init(name , color)  // 构造器代理
//    }
//// 为构造器显式指定外部形参名
//    init(appleName n: String , appleColor c:String)
//{
//    //		name = "临时值" // 这行代码将导致错误
//    self.init(n , c)  // 构造器代理
//    // 调用构造器代理之后，即可通过self访问该实例的属性
//    println("--执行显式指定外部形参名的构造器--\(self.name)")
//    }
//// 定义三个参数的构造器
//    init(name: String , color: String , weight: Double)
//{
//    self.init(name , color)  // 构造器代理
//    self.weight = weight
//    }
//}
//var ap1 = Apple("红富士" , "粉红色")
//println("\(ap1.name)--->\(ap1.color)")
//var ap2 = Apple(appleName:"青苹果" , appleColor:"绿色")
//println("\(ap2.name)--->\(ap2.color)")
//var ap3 = Apple(name:"美国苹果" , color:"红色" , weight:0.45)
//
//




/*可能失败的构造器*/

struct Cat
        {
        let name: String
        init?(name: String) {
        // 如果传入的name参数为空字符串，构造器失败，返回nil
        if name.isEmpty {
        return nil
        }
        self.name = name
        }
}
let c1 = Cat(name: "Kitty")
if c1 != nil {
        // 创建c1的构造器是init?，因此程序必须对c1执行强制解析
        println("c1的name为：\(c1!.name)")
    }
let c2 = Cat(name: "")
println(c2 == nil) // 输出true，表明c2为nil




enum Season{
    case Spring, Summer, Autumn, Winter
    // 使用init!定义可能失败的构造器，则该构造器创建的实例可进行隐式解析
    init!(name: Character) {
        // 根据传入的构造器参数选择相应的枚举成员
        switch name {
        case "S","s":
            self = .Spring
        case "U", "u":
            self = .Summer
        case "A", "a":
            self = .Autumn
        case "W", "w":
            self = .Winter
            // 如果传入其他参数，构造失败，返回nil。
        default:
            return nil
        }
    }
}
let s1 = Season(name: "s")
if s1 != nil {
    println("Season实例构造成功！")
}
let s2 = Season(name: "x")
println(s2 == nil)

/*
1.Swift只为类提供一个无参数的构造器。
2.Swift为结构体提供两个构造器：无参数的构造器和初始化所有实例存储属性的构造器。

*/














