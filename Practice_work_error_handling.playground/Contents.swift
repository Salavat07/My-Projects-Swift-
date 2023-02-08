import UIKit


enum SomeErrors: Error {
    case badRequest
    case notFound
    case InternalServerError
    case typesAreEqual
    case typesAreNotEqual
}
var badRequest:Bool = true
var notFound:Bool = false
var InternalServerError:Bool = false
var typesAreEqual:Bool = true
var typesAreNotEqual:Bool = false

do {
    if badRequest{
        throw SomeErrors.badRequest
    }
    if notFound{
        throw SomeErrors.notFound
    }
    if InternalServerError{
        throw SomeErrors.InternalServerError
    }
}
catch SomeErrors.badRequest{
    print("Error 400! You don't have permission to access hhtp/skillfactiry.ru/courses/IOS-developer")
}
catch SomeErrors.notFound{
    print("Error 404! website you trying to access is not found")
}
catch SomeErrors.InternalServerError{
    print("Error 500! please check your connection to server")
}

func SelfHandling() throws{
    if badRequest{
        throw SomeErrors.badRequest
    }
    if notFound{
        throw SomeErrors.notFound
    }
    if InternalServerError{
        throw SomeErrors.InternalServerError
    }
}
do {
    try SelfHandling()
}
catch SomeErrors.badRequest{}
catch SomeErrors.notFound{}
catch SomeErrors.InternalServerError{}

func Types <T:Equatable> (a:T, b:T){
    if a == b{
        print("Yes")
    }
    else {
        print("No")
    }
}
Types(a: 30, b: 33.0)

func ErrorThrowing <T:Equatable> (a:T, b:T) throws{
    if a != b{
        throw SomeErrors.typesAreNotEqual
    }
    if a == b{
        throw SomeErrors.typesAreEqual
    }
    do {
        try ErrorThrowing(a: 30, b: 30)
    }
    catch SomeErrors.typesAreNotEqual{
        print("Oups! Types are not equal")
    }
    catch SomeErrors.typesAreEqual{
        print("Oups! Types are equal")
    }
}


    func TypesComparison <T:Equatable> (first:T,second:T){
        if first == second{
            print("Yes")
        }
        else {
            print("No")
        }
    }
    TypesComparison(first: 9, second: 11.0)


>1234567890-=ПАИВЧЫМЯФЧ]>11 >
