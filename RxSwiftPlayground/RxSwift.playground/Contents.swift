//: Please build the scheme 'RxSwiftPlayground' first
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift

let names = Variable(["leo"])

names.asObservable()
  .filter({ (value) -> Bool in
      return value.count > 1
  })
  .debug()
  .map({ (value) -> String in
    return "users: \(value)"
  })
  .subscribe { (value) in
    print(value)
}


names.value = ["leo", "john"]
names.value = ["lala", "man"]

delay(seconds: 2) {
  names.value = ["man"]
}

delay(seconds: 3) {
  names.value = ["admin"]
}
