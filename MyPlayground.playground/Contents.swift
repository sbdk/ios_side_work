//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let nickName: String? = "sbdk"
let fullName: String = "Li Yin"

let informalGreeting = "Hi, \(nickName ?? fullName)"


enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00AM", "7:00PM")
let failure = ServerResponse.Error("Out of cheese")

switch success {
    
case let .Result(sunrise, sunset):
    print("Sunrise is at\(sunrise) and sunset is at\(sunset)")
case let .Error(error):
    print("Failure... \(error)")
}