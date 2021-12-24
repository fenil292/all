import UIKit

enum Check_Age: Error{
    case invalid_age
    case nagative
    var message:String{
        switch self {
        case .invalid_age: return "ERROR: Age Should be Grater then 18"
        case .nagative: return "ERROR: Age Should be Positive"
        }
    }
}
func valid_age(no:Int) throws{
    if(no<0){
        throw Check_Age.nagative
    }
    else if(no<18){
        throw Check_Age.invalid_age
    }
    else{
        print("Age is Valid")
    }
}
do {
    try valid_age(no: -8)
}
catch{
    if let error=error as? Check_Age{
        print(error.message)
    }
}
