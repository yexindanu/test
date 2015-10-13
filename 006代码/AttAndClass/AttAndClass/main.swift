//
//  main.swift
//  AttAndClass
//
//  Created by CarolWang on 15/4/14.
//  Copyright (c) 2015年 com.jikexueyuan. All rights reserved.
//

import Foundation
//1.值类型的类型属性
enum Season
    {
    // 为枚举定义类型存储属性，使用可选类型，系统将其初始化为nil
    static var desc : String?
    // 为枚举定义类型存储属性，且声明为常量
    static let name = "季节"
    static var info: String{
    get{
    return "代表季节的枚举，其desc为:\(desc)"
    }
    set{
    println("程序尝试对info计算属性进行赋值:\(newValue)")
    }
    }
}
// 对Season枚举的类型属性赋值
Season.desc = "季节类"
println(Season.name)
Season.info = "新的info"
println(Season.info)
/*结构体可以包含实例计算属性，不能包含实例存储属性*/
    
struct FkRange
        {
        // 为结构体定义类型存储属性，使用可选类型，系统将其初始化为nil
        static var desc : String?
        // 为结构体定义类型存储属性，且声明为常量
        static let maxWidth = 10000
        static let maxHeight = 40000
        // 定义类型计算属性，该属性只有get部分，是一个只读属性
        static var maxArea: Int{
        return maxWidth * maxHeight
        }
}
FkRange.desc = "描述范围的结构体"
println(FkRange.desc)
println(FkRange.maxWidth)
println(FkRange.maxHeight)
println(FkRange.maxArea)
// 2.类的类型属性
class User
        {
        // 为类定义类型计算属性
        class var nameMaxLength : Int{
        get {
        return 24
        }
        set {
        println("程序尝试对User类的nameMaxLength类型计算属性赋值：\(newValue)")
        }
        }
}
println(User.nameMaxLength)
User.nameMaxLength = 20

/*类中不可以定义类型存储属性，只能包含类型计算属性*/
 
  
    //3.  值类型的类型方法

enum Season2
        {
        // 为枚举定义类型存储属性，使用可选类型，系统将其初始化为nil
        static var desc : String?
        // 为枚举定义类型存储属性，且声明为常量
        static let name = "季节"
        // 定义无参数的类型方法
        static func info()
    {
        println("季节类的info方法，该类的name存储属性为：\(name)")
        }
        // 定义带一个参数的类型方法
        static func setDesc(desc : String)
    {
        self.desc = desc  // ①
        }	
}
Season2.info()
Season2.setDesc("描述季节变化的枚举")
println(Season2.desc)
//4.  类的类型方法
class Math
    {
    // 类不允许定义类型存储属性，使用类型计算属性代替
    class var pi: Double{
    return 3.1415926535897932384626
    }
    class func abs(value : Double) -> Double
{
    return value < 0 ? -value : value
    }
    // 定义类型方法，取消第二个形参的外部形参名
    class func pow(base: Double , _ exponent: Int) -> Double
{
    var result = 1.0
    for idx in 1...exponent
{
    result *= base
    }
    return result
    }
    // 定义类型方法，类型方法可直接访问类型属性
    class func radian2Degree(radian:Double) -> Double
{
    return radian * 180 / pi
    }
    // 定义类型方法，类型方法可通过self引用类型属性
    class func degree2Radian(degree:Double) -> Double
{
    return degree * self.pi / 180
    }
}
println(Math.pi)
println(Math.pow(2 , 4))
println(Math.radian2Degree(1.57))
println(Math.degree2Radian(45))

