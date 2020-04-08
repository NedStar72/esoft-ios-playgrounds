# Swift Style Guide

Обязателены к прочтению и ознакомлению [Apple's API Design Guidelines](https://swift.org/documentation/api-design-guidelines/).

Особенности этого руководства + дополнительные уточнения указаны ниже.

Версия руководства 1.0-aplha. Декабрь 2018

## Table Of Contents

- [Swift Style Guide](#swift-style-guide)
    - [1. Code Formatting](#1-code-formatting)
    - [2. Naming](#2-naming)
    - [3. Coding Style](#3-coding-style)
        - [3.1 General](#31-general)
        - [3.2 Access Modifiers](#32-access-modifiers)
        - [3.3 Custom Operators](#33-custom-operators)
        - [3.4 Switch Statements and `enum`s](#34-switch-statements-and-enums)
        - [3.5 Optionals](#35-optionals)
        - [3.6 Protocols](#36-protocols)
        - [3.7 Properties](#37-properties)
        - [3.8 Closures](#38-closures)
        - [3.9 Arrays](#39-arrays)
        - [3.10 Error Handling](#310-error-handling)
        - [3.11 Using `guard` Statements](#311-using-guard-statements)
        - [3.12 Delegates](#312-delegates)
    - [4. Documentation/Comments](#4-documentationcomments)
        - [4.1 Documentation](#41-documentation)
        - [4.2 Other Commenting Guidelines](#42-other-commenting-guidelines)
    - [5. Order code in files](#5-order-code-in-files)
        - [5.1 Order in files](#51-order-in-files)
        - [5.2 Order in classes](#52-order-in-classes)
## 1. Code Formatting

* **1.1** Используйте 2 spaces для tabs.
* **1.2** Избегайте нечитаемых длинных строк кода и не превышайте максимум в 160 символов на линию (Xcode->Preferences->Text Editing->Page guide at column: 160 будет полезно)
* **1.3** Пустая строка должна быть в конце каждого файла.
* **1.4** В строках не должно быть лишних пробелов (Xcode->Preferences->Text Editing->Automatically trim trailing whitespace + Including whitespace-only lines).
* **1.5** Не располагайте открывающую скобку на новой линии - используйте [1TBS стиль](https://en.m.wikipedia.org/wiki/Indentation_style#1TBS).

```swift
class SomeClass {
  func someMethod() {
    if x == y {
      /* ... */
    } else if x == z {
      /* ... */
    } else {
      /* ... */
    }
  }

  /* ... */
}
```

* **1.6** При указании Type для свойства (property), переменной (variable), константы (constant), ключа для словаря (key, dictionary), аргумента функции, соответствии протокола (protocol conformance) или суперкласса (superclass) не ставьте пробел перед двоеточием.

```swift
// specifying type
let pirateViewController: PirateViewController

// dictionary syntax
let ninjaDictionary: [String: AnyObject] = [
  "fightLikeDairyFarmer": false,
  "disgusting": true
]

// declaring a function
func myFunction<T, U: SomeProtocol>(firstArgument: U, secondArgument: T) where T.RelatedType == U {
  /* ... */
}

// calling a function
someFunction(someArgument: "Kitten")

// superclasses
class PirateViewController: UIViewController {
  /* ... */
}

// protocols
extension PirateViewController: UITableViewDataSource {
  /* ... */
}
```

* **1.7** В общем, после запятой должен следовать пробел.

```swift
let myArray = [1, 2, 3, 4, 5]
```

* **1.8** Перед бинарными операторами, такими как `+`, `==`, или `->`, а так же после них должен быть пробел. Также не должно быть пробелов после `(` и перед `)`.

```swift
let myValue = 20 + (30 / 2) * 3
if 1 + 1 == 3 {
    fatalError("The universe is broken.")
}
func pancake(with syrup: Syrup) -> Pancake {
    /* ... */
}
```

* **1.9** Мы используем рекомендованные Xcode правила отступа (т.е. ваш код не должен меняться, если применить CTRL-I). Когда мы объявляем метод, который охватывает несколько строк - предпочтительно использовать синтаксис, который применяется в Xcode по умолчанию с версии 7.3.

```swift
// Xcode indentation for a function declaration that spans multiple lines
func myFunctionWithManyParameters(parameterOne: String,
                                  parameterTwo: String,
                                  parameterThree: String) {
  // Xcode indents to here for this kind of statement
  print("\(parameterOne) \(parameterTwo) \(parameterThree)")
}

// Xcode indentation for a multi-line `if` statement
if myFirstValue > (mySecondValue + myThirdValue)
    && myFourthValue == .someEnumValue {

  // Xcode indents to here for this kind of statement
  print("Hello, World!")
}
```

* **1.10** При вызове метода, который имеет много аргументов, каждый из этих аргументов предпочтительнее расположить на новой строке с дополнительным отступом.
```swift
someFunctionWithManyArguments(
  firstArgument: "Hello, I am a string",
  secondArgument: resultFromSomeFunction(),
  thirdArgument: someOtherLocalProperty)
```

* **1.11** Когда мы имеем дело с достаточно большими массивами или словарями, которые необходимо разбить на несколько строк, мы поступаем с ними аналогично параметрам функции. Аналогичное поведение с замыканиями (см. пример).

```swift
someFunctionWithABunchOfArguments(
  someStringArgument: "hello I am a string",
  someArrayArgument: [
    "He who fears being watched from the abyss",
    "will be unable to look into it himself.",
    "The truth can only be obtained by pressing forward."
  ],
  someDictionaryArgument: [
    "dictionary key 1": "some value 1, but also some more text here",
    "dictionary key 2": "some value 2"
  ],
  someClosure: { parameter1 in
    print(parameter1)
  })
```

* **1.12** Рекомендуется использовать локальные константы, чтобы избежать многострочных условий там, где это возможно.

```swift
// PREFERRED
let firstCondition = x == firstReallyReallyLongPredicateFunction()
let secondCondition = y == secondReallyReallyLongPredicateFunction()
let thirdCondition = z == thirdReallyReallyLongPredicateFunction()
if firstCondition && secondCondition && thirdCondition {
    // do something
}

// NOT PREFERRED
if x == firstReallyReallyLongPredicateFunction()
    && y == secondReallyReallyLongPredicateFunction()
    && z == thirdReallyReallyLongPredicateFunction() {
    // do something
}
```

* **1.13** Перенос запятых на новую строку, если используется более 3 условий
```swift
// PREFERRED
if isEmpytObject, isEmpytObject, isEmpytObject {

}

// NOT PREFERRED
if isEmpytObject, isEmpytObject, isEmpytObject {

}
```
* **1.14** В случае если необходим один простой `if`, то возможно лучше использовать тернарный оператор.
* **1.15** В работе с цепочкой вызовов пользуемся переносами перед строкой
```swift
Driver.merge(flow1, flow2)
  .map { $0 * 10 }
  .filter { $0 > 0 }
  .map { String($0) }
  .drive(button.rx.title)
  .disposed(by: disposeBag)
```

## 2. Naming

* **2.1** Нет необходимости в Obj-C стиле именования с префиксами в Swift (т.е. просто использовать `SearchFilter` вместо `ETSearchFilter`).

* **2.2** Используйте `PascalCase` для именования типов (т.е. `struct`, `enum`, `class`, `typedef`, `associatedtype`, и тд.).

* **2.3** Используйте `camelCase` (первая буква строчная) для функций (function), методов (method), свойств (property), констант (constant), переменных (variable), имен аргументов (argument names), перечислений enum (cases), и тд.

* **2.4** Когда мы имеем дело с акронимами или другими именами, которые должны быть написаны в верхнем регистре - мы используем их в верхнем регистре в коде. Исключение составляют случаи, когда акроним должен быть в начале имени, которое должно быть написано в нижнем регистре - в таком случае весь акроним пишется в нижнем регистре.

```swift
// "HTML" is at the start of a constant name, so we use lowercase "html"
let htmlBodyContent: String = "<p>Hello, World!</p>"
// Prefer using ID to Id
let profileID: Int = 1
// Prefer URLFinder to UrlFinder
class URLFinder {
  /* ... */
}
```

* **2.5** Все instance-independent (независимые от инстанса класса) константы должны быть объявлены как `static`. Все подобные `static` константы должны быть расположены вместе в промаркированной секции своих `class`, `struct` или `enum`. Для классов с большим количеством констант необходимо группировать по похожим или одинаковым префиксам, суффиксам и/или use-cases (сценариям использования).

```swift
// PREFERRED    
class MyClassName {
    // MARK: - Constants
    static let buttonPadding: CGFloat = 20.0
    static let indianaPi = 3
    static let shared = MyClassName()
}

// NOT PREFERRED
class MyClassName {
  // Don't use `k`-prefix
  static let kButtonPadding: CGFloat = 20.0

  // Don't namespace constants
  enum Constant {
    static let indianaPi = 3
  }
}
```

* **2.6** Для обобщений (generics) и связанных типов (associated types), используйте `PascalCase` слово для описания. Если именование обобщения конфликтует с протоколом, которому соответствует, и/или суперклассу, который расширяет, - можно добавить суффикс `Type` к связанному типу или имени обобщения.
```swift
class SomeClass<Model> { /* ... */ }
protocol Modelable {
  associatedtype Model
}
protocol Sequence {
  associatedtype IteratorType: Iterator
}
```

* **2.7** Имена должны быть наглядными и недвусмысленными.

```swift
// PREFERRED
class RoundAnimatingButton: UIButton { /* ... */ }

// NOT PREFERRED
class CustomButton: UIButton { /* ... */ }
```

* **2.8** Не сокращайте имена и не используйте однобуквенные переменные.

```swift
// PREFERRED
class RoundAnimatingButton: UIButton {
  let animationDuration: NSTimeInterval

  func startAnimating() {
    let firstSubview = subviews.first
  }

}

// NOT PREFERRED
class RoundAnimating: UIButton {
  let aniDur: NSTimeInterval

  func srtAnmating() {
    let v = subviews.first
  }
}
```

* **2.9** Добавляйте информацию о типе в константах и переменных, особенно если это неочевидно.

```swift
// PREFERRED
class ConnectionTableViewCell: UITableViewCell {
    let personImageView: UIImageView

    let animationDuration: TimeInterval

    // it is ok not to include string in the ivar name here because it's obvious
    // that it's a string from the property name
    let firstName: String

    // though not preferred, it is OK to use `Controller` instead of `ViewController`
    let popupController: UIViewController
    let popupViewController: UIViewController

    // when working with a subclass of `UIViewController` such as a table view
    // controller, collection view controller, split view controller, etc.,
    // fully indicate the type in the name.
    let popupTableViewController: UITableViewController

    // when working with outlets, make sure to specify the outlet type in the
    // property name.
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

}

// NOT PREFERRED
class ConnectionTableViewCell: UITableViewCell {
    // this isn't a `UIImage`, so shouldn't be called image
    // use personImageView instead
    let personImage: UIImageView

    // this isn't a `String`, so it should be `textLabel`
    let text: UILabel

    // `animation` is not clearly a time interval
    // use `animationDuration` or `animationTimeInterval` instead
    let animation: TimeInterval

    // this is not obviously a `String`
    // use `transitionText` or `transitionString` instead
    let transition: String

    // this is a view controller - not a view
    let popupView: UIViewController

    // as mentioned previously, we don't want to use abbreviations, so don't use
    // `VC` instead of `ViewController`
    let popupVC: UIViewController

    // even though this is still technically a `UIViewController`, this property
    // should indicate that we are working with a *Table* View Controller
    let popupViewController: UITableViewController

    // for the sake of consistency, we should put the type name at the end of the
    // property name and not at the start
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var buttonSubmit: UIButton!

    // we should always have a type in the property name when dealing with outlets
    // for example, here, we should have `firstNameLabel` instead
    @IBOutlet weak var firstName: UILabel!
}
```

* **2.10** При именовании аргументов функции убедитесь, что в функции легко читается назначение каждого из аргументов.

* **2.11** Согласно [Apple's API Design Guidelines](https://swift.org/documentation/api-design-guidelines/), `protocol` должен быть именован как сушествительное, если он описывает действие (т.е. `Collection`), и использовать суффиксы `able`, `ible` или `ing`, если описывает возможности (т.е. `Equatable`, `ProgressReporting`). Если ни один из этих вариантов не подходит к вашему случаю, можно использовать суффикс `Protocol` в имени. Ниже приведены некоторые примеры.

```swift
// here, the name is a noun that describes what the protocol does
protocol TableViewSectionProvider {
  func rowHeight(at row: Int) -> CGFloat
  var numberOfRows: Int { get }
  /* ... */
}

// here, the protocol is a capability, and we name it appropriately
protocol Loggable {
  func logCurrentState()
  /* ... */
}

// suppose we have an `InputTextView` class, but we also want a protocol
// to generalize some of the functionality - it might be appropriate to
// use the `Protocol` suffix here
protocol InputTextViewProtocol {
  func sendTrackingEvent()
  func inputText() -> String
  /* ... */
}
```

## 3. Coding Style

### 3.1 General

* **3.1.1** `let` предпочтительнее, чем `var`, когда это возможно.

* **3.1.2** Предпочтительнее композиция из `map`, `filter`, `reduce`, и т.д. для преобразования одной коллекции в другую. Избегайте использования замыканий с сайд-эффектами в этих методах.

```swift
// PREFERRED
let stringOfInts = [1, 2, 3].flatMap { String($0) }
// ["1", "2", "3"]

// NOT PREFERRED
var stringOfInts: [String] = []
for integer in [1, 2, 3] {
  stringOfInts.append(String(integer))
}

// PREFERRED
let evenNumbers = [4, 8, 15, 16, 23, 42].filter { $0 % 2 == 0 }
// [4, 8, 16, 42]

// NOT PREFERRED
var evenNumbers: [Int] = []
for integer in [4, 8, 15, 16, 23, 42] {
  if integer % 2 == 0 {
    evenNumbers.append(integer)
  }
}
```

* **3.1.3** Рекомендуется всегда обьявлять тип переменной.

* **3.1.4** Если метод возвращает несколько значений, предпочтительно использовать tuple (лучше всего использовать labeled tuples, чтобы обозначить возвращаемое значение, когда это неочевидно). Если определенный tuple используется больше одного раза - предпочтительнее использовать `typealias`. Если необходимо вернуть 3 или больше значений в tuple, лучше использовать `struct` или `class`.

```swift
func pirateName() -> (firstName: String, lastName: String) {
  return ("Jack", "Sparrow")
}

let name = pirateName()
let firstName = name.firstName
let lastName = name.lastName
```

* **3.1.5** Будьте осторожны с retain cycles при создании delegates/protocols для ваших классов. Как правило, эти свойства должны быть помечены как `weak`.
* **3.1.6** Будьте осторожны при обращении к `self` напрямую из escaping closure, так как это может вызвать retain cycle - используйте [capture list](https://developer.apple.com/library/ios/documentation/swift/conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-XID_163), когда это может быть необходимо:
```swift
myFunctionWithEscapingClosure() { [weak self] (error) -> Void in
  // you can do this

  self?.doSomething()

  // or you can do this

  guard let strongSelf = self else {
    return
  }

  strongSelf.doSomething()
}
```

* **3.1.7** Не используйте именованные прерывания (labeled breaks).
* **3.1.8** Не используйте скобки вокруг условий control flow.
```swift
// PREFERRED
if x == y {
    /* ... */
}

// NOT PREFERRED
if (x == y) {
    /* ... */
}
```

* **3.1.9** Избегайте явного указания типа `enum`, где это возможно - используйте короткую запись.

```swift
// PREFERRED
imageView.setImageWithURL(url, type: .person)

// NOT PREFERRED
imageView.setImageWithURL(url, type: AsyncImageView.Type.person)
```

* **3.1.10** Старайтесь не использовать сокращенную запись для методов класса, так как зачастую сложнее выделить контекст класса в противоположность `enum`.

```swift
// PREFERRED
imageView.backgroundColor = UIColor.white

// NOT PREFERRED
imageView.backgroundColor = .white
```

* **3.1.11** Предпочтительно указывать `self.`.
* **3.1.12** При написании метода держите в голове - "должен метод быть переопределен или нет?". Если нет, помечайте его как `final`, но помните? что это может предотвратить его переопределение, в том числе и для тестовых целей. В целом - `final` метод ускоряют процесс сборки, поэтому предпочтительно использовать их, где они применимы. Также стоит быть осторожным, применяя их в библиотеках и frameworks, так как изменение final метода становится непростой задачей.

* **3.1.13** При использовании операторов `else`, `catch`, и т.д., после которых следует блок, ключевое слово стоит располагать на той же строчке, что и блок выражения on. Напоминаю про правило [1TBS style](https://en.m.wikipedia.org/wiki/Indentation_style#1TBS). Пример `if`/`else` и `do`/`catch` приведен ниже.

```swift
if someBoolean {
  // do something
} else {
  // do something else
}

do {
  let fileContents = try readFile("filename.txt")
} catch {
  print(error)
}
```

* **3.1.14** Предпочтительнее использовать `static`  по отношению к `class` при обьявлении метода или свойства которое связано с классом, но не с его экземпляром. Используйте `class` если планируете что функционал может быть перезаписан(overriding) в дочернем классе, либо используйте `protocol`, чтобы добится такого поведения.

* **3.1.15** Если есть функция, которая не принимает аргументов, не имеет сайд эффектов и возвращает какое либо значение или объект, предпочтительно использовать computed property.

* **3.1.16** Старайтесь минимизировать количество `import`. Например, не писать `import UIKit`, когда `Foundation` вполне достаточно.

* **3.1.17** Неиспользуемый (мертвый) код, включая шаблоны Xcode, а также `placeholder`-комментарии, должен быть удален.
```swift
// PREFERRED
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return Database.contacts.count
}

// NOT PREFERRED
override func didReceiveMemoryWarning() {
  super.didReceiveMemoryWarning()
  // Dispose of any resources that can be recreated.
}

override func numberOfSections(in tableView: UITableView) -> Int {
  // #warning Incomplete implementation, return the number of sections
  return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  // #warning Incomplete implementation, return the number of rows
  return Database.contacts.count
}
```

* **3.1.18** Golden Path. При использовании условий правая часть выражения должна содержать "golden" или позитивный (положительный) сценарий выполнения.

```swift
// PREFERRED
func computeFFT(context: Context?, inputData: InputData?) throws -> Frequencies {

  guard let context = context else { 
    throw FFTError.noContext 
  }
  guard let inputData = inputData else { 
    throw FFTError.noInputData 
  }
    
  // use context and input to compute the frequencies
    
  return frequencies
}

// NOT PREFERRED
func computeFFT(context: Context?, inputData: InputData?) throws -> Frequencies {

  if let context = context {
    if let inputData = inputData {
      // use context and input to compute the frequencies

       return frequencies
    } else {
      throw FFTError.noInputData
      }
  } else {
    throw FFTError.noContext
  }
}
```
* **3.1.19** Старайтесь не использовать большую вложенность, если в ней нет необходимости - это усложняет понимание кода.
* **3.1.20** Старайтесь избегать чрезмерного написания модификаторов доступа и self.

### 3.2 Access Modifiers

* **3.2.1** Модификатор доступа должен быть объявлен первым.

```swift
// PREFERRED
private static let myPrivateNumber: Int

// NOT PREFERRED
static private let myPrivateNumber: Int
```

* **3.2.2** Модификатор доступа не должен находится на отдельной строке - он должен находится на одной строке с описываемой сущностью.

```swift
// PREFERRED
open class Pirate {
  /* ... */
}

// NOT PREFERRED
open
class Pirate {
  /* ... */
}
```

* **3.2.3** В общем случае нет необходимости писать `internal` модификатор, так как он является модификатором по умолчанию.

* **3.2.4** Если свойство должно быть доступно во время вполнения unit теста, необхоидмо будет пометить его как `internal`, чтобы иметь возможность использовать с `@testable import ModuleName`. Если свойство должно быть приватным, но помечено как `internal` для unit тестов, убедитесь, что этот участок кода задокументирован и в нем описана причина такого поведения. При необходимости можно использовать синтаксис `- warning:`  как показано ниже.
```swift
/**
 This property defines the pirate's name.
 - warning: Not `private` for `@testable`.
 */
let pirateName = "LeChuck"
```

* **3.2.5** Предпочтительнее `private`, чем `fileprivate`, где возможно.
* **3.2.6** Выбирая между `public` и `open`, выбирайте `open`, если вы хотите, чтобы данная сущность была subclassable вне модуля, и `public` в остальных случаях. Обратите внимание, что `internal` и выше может быть унаследовано в тестах при использовании `@testable import`, так что это не должно быть причиной использования `open`. В общем можно свободно использовать `open`, когда дело доходит до libraires и frameworks, но стоит использовать аккуратно, когда дело доходит до модулей в кодовой базе приложения, где легко изменить поведение в нескольких модулях одновременно.

### 3.3 Custom Operators

Предпочтительнее использовать именнованные функции, чем custom operators.
Если вы хотите объявить собственный оператор в global scope, убедитесь, что для этого есть *очень* веская причина.
Вы можете переопределить существующие операторы для поддержки новых типов (особенно `==`). Тем не менее новое объявление должно сохранять семантику и поведение оператора. Для примера, `==` должен проверять равенство и возвращать boolean.

### 3.4 Switch Statements and `enum`s

* **3.4.1** При использовании switch с конечным списком возможных вариантов (`enum`), *нет необходимости* добавлять `default` case. Вместо этого расположите неиспользуемые case в конце вместе с ключевым словом `break`, чтобы прервать выполнение.
* **3.4.2** Так как `switch` в Swift break по умолчанию, нет необходимости объявлять ключевое слово `break`.
* **3.4.3** `case` должен быть выровнен в одну линию со `switch`, как определено стандартами Swift.
* **3.4.4** При объявлении перечисления, которое содержит связанное значение, необходимо указать соответствующий label в дополнении к типу(т.е. `case hunger(hungerLevel: Int)` вместо `case hunger(Int)`).

```swift
enum Problem {
  case attitude
  case hair
  case hunger(hungerLevel: Int)
}

func handleProblem(problem: Problem) {
  switch problem {
  case .attitude:
    print("At least I don't have a hair problem.")
  case .hair:
    print("Your barber didn't know when to stop.")
  case .hunger(let hungerLevel):
    print("The hunger level is \(hungerLevel).")
  }
}
```

* **3.4.5** Допустимо в перечислениях (e.g. `case 1, 2, 3:`) использовать `fallthrough` при необходимости.

* **3.4.6** Если есть case по умолчанию(default case), который никогда не должен быть выполнен, предпочтительно кидать ошибку(throw an error) или обеспечивать проверку похожими средствами, например, assert.

```swift
func handleDigit(_ digit: Int) throws {
  switch digit {
  case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
    print("Yes, \(digit) is a digit!")
  default:
    throw Error(message: "The given number was not a digit.")
  }
}
```
* **3.4.7** Если есть сложный `if` стоит искать возможность замены его на `switch`, чтобы уменьшить вложенность.

### 3.5 Optionals

* **3.5.1** Единственный случай, когда стоит использовать неявно развернутые опционалы (implicitly unwrapped optionals), - это `@IBOutlet`s. В остальных случаях лучше использовать non-optional или обычные optional значения. Конечно, всегда есть случаи, в которых вы можете "гарантировать", что значение никогда не будет `nil` при использовании, но лучше перестраховаться и быть последовательными. По тем же причинам не используйте force unwraps.

* **3.5.2** Не используйте `as!` или `try!`.

* **3.5.3** Если вы не планируете хранить значение, которое было в optional, а лишь хотите понять, было ли оно `nil` - явно проверяйте на `nil` вместо `if let` конструкции.

```swift
// PREFERERED
if someOptional != nil {
  // do something
}

// NOT PREFERRED
if let _ = someOptional {
  // do something
}
```

* **3.5.4** Не используйте `unowned`. Так как мы не хотим использовать неявный unwrap, по тем же причинам мы не хотим `unowned` свойства.

```swift
// PREFERRED
weak var parentViewController: UIViewController?

// NOT PREFERRED
weak var parentViewController: UIViewController!
unowned var parentViewController: UIViewController
```

* **3.5.5** При unwrapping опционалов используйте то же самое имя переменной, что и имя опционала, когда это применимо.

```swift
guard let myValue = myValue else {
  return
}
```

### 3.6 Protocols

Есть два способа реализации протоколов в вашем коде:

1. Использовать `// MARK:`, чтобы отделить код реализации протокола внутри `class`/`struct`
2. Использовать extension вне `class`/`struct`, но в том же файле.

Нужно помнить, что методы, объявленные в extension, не могут быть переопределены в subclass. В таком случае имеет смысл использовать метод #1. В остальных случаях предпочтительнее метод #2.

Даже при использовании метода #2 добавляйте `// MARK:` для читаемости и навигации в Xcode.

### 3.7 Properties

* **3.7.1** При объявлении read-only, вычисляемого значения, описывайте getter без provide the getter без конструкции `get {}` вокруг.

```swift
var computedProperty: String {
  if someBool {
    return "It's easy to be right"
  }
  return "Maybe you were right"
}
```

* **3.7.2** При использовании `get {}`, `set {}`, `willSet` и `didSet` отделяйте эти блоки отступом.
* **3.7.3** Хотя вы можете задать свои имена для предыдущих и новых значений для `willSet`/`didSet` и `set`, предпочтительнее использовать стандартные `newValue`/`oldValue` идентификаторы.

```swift
var storedProperty: String = "I'm selling these fine leather jackets." {
  willSet {
    print("will set to \(newValue)")
  }
  didSet {
    print("did set from \(oldValue) to \(storedProperty)")
  }
}

var computedProperty: String  {
  get {
    if someBool {
      return "I'm a mighty pirate!"
    }
    return storedProperty
  }
  set {
    storedProperty = newValue
  }
}
```

* **3.7.4** Можно объявить singleton свойство, как показано ниже:

```swift
class PirateManager {
  static let shared = PirateManager()

  /* ... */
}
```
* **3.7.5** Старайтесь избегать создания экземпляров в `get {}`, если это не нужно явно. 

### 3.8 Closures

* **3.8.1** Если типы параметров очевидны, то можно опустить их, но также можно указать явно. Иногда читаемость кода повышается в разы с явным указанием типа, объясняющим поведение, или же при отбрасывании повторяющихся частей. Главное правило - сохранить консистентность.

```swift
// omitting the type
doSomethingWithClosure() { response in
  print(response)
}

// explicit type
doSomethingWithClosure() { (response: NSURLResponse) in
  print(response)
}

// using shorthand in a map statement
[1, 2, 3].flatMap { String($0) }
```

* **3.8.2** При объявлении замыкания как типа не следует заключать его в скобки, если в этом нет необходимости (прим. если тип опционален).

```swift
let completionBlock: (Bool) -> Void = { success in
  print("Success? \(success)")
}

let completionBlock: () -> Void = {
  print("Completed!")
}

let completionBlock: (() -> Void)? = nil
```

* **3.8.3** Имя параметра должно находится на одной строке с открывающейся скобкой, где это возможно без переполнения (т.е. правило 160 знаков).

* **3.8.4** Используйте синтаксис завершающего замыкания, если при этом не теряется смысл выражения без указания имени параметра (в качестве примера можно взять метод, который имеет в качестве параметров success и failure).

```swift
// trailing closure
doSomething(1.0) { (parameter1) in
  print("Parameter 1 is \(parameter1)")
}

// no trailing closure
doSomething(1.0, success: { (parameter1) in
  print("Success with \(parameter1)")
}, failure: { (parameter1) in
  print("Failure with \(parameter1)")
})
```

### 3.9 Arrays

* **3.9.1** В общем случае старайтесь избегать прямого обращения к элементам массива по индексу. Когда возможно, старайтесь использовать методы `.first` или `.last`. Предпочтительнее использовать конструкцию `for item in items` нежели `for i in 0 ..< items.count`, когда возможно. Если необходимо обратиться напрямую к элементу, убедитесь, что сделали необходимую проверку границ/наличия элемента. Можно использовать конструкцию `for (index, value) in items.enumerated()`, чтобы получить и index, и значение.

* **3.9.2** Никогда не используйте операторы `+=` или `+` для добавления/конкатенирования массивов. Вместо этого используйте `.append()` или `.append(contentsOf:)` как более производительные (по крайней мере в отношении времени компиляции) в текущем состоянии языка Swift. Если вы объявляете массив, который строится на основе других массивов, и хотите сохранить его иммутабельным - вместо `let myNewArray = arr1 + arr2` используйте `let myNewArray = [arr1, arr2].joined()`.


### 3.10 Error Handling

Предположим, метод `myFunction` должен возвращать `String`, хотя в некоторых случаях во время выполнения может возникнуть ошибка. Обычный подход в таком случае - это возвращать опционал `String?`, если мы можем получить `nil`, когда что-то пойдет не так.

Example:

```swift
func readFile(named filename: String) -> String? {
  guard let file = openFile(named: filename) else {
    return nil
  }

  let fileContents = file.read()
  file.close()
  return fileContents
}

func printSomeFile() {
  let filename = "somefile.txt"
  guard let fileContents = readFile(named: filename) else {
    print("Unable to open file \(filename).")
   return
  }
  print(fileContents)
}
```

Вместо этого лучше использовать стандартное в Swift `try`/`catch` поведение, особенно если нам необходимо знать причину ошибочного поведения.

Мы можем воспользоваться подобной `struct`:

```swift
struct Error: Swift.Error {
  public let file: StaticString
  public let function: StaticString
  public let line: UInt
  public let message: String

  public init(message: String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
    self.file = file
    self.function = function
    self.line = line
    self.message = message
  }
}
```

Пример использования:

```swift
func readFile(named filename: String) throws -> String {
  guard let file = openFile(named: filename) else {
    throw Error(message: "Unable to open file named \(filename).")
  }

  let fileContents = file.read()
  file.close()
  return fileContents
}

func printSomeFile() {
  do {
    let fileContents = try readFile(named: filename)
    print(fileContents)
  } catch {
    print(error)
  }
}
```

Конечно бывают исключения, в которых использование опционала может быть оправданно. Если возвращаемый результат *семантически* должен быть `nil` - в таком случае имеет смысл оставить опционал, нежели сделать обработку ошибки.

Общее правило - если метод может "упасть" и причина падения можеть быть неочевидна на первый взгляд при использовании опционала, тогда этот метод должен бросать ошибку.

### 3.11 Using `guard` Statements

* **3.11.1** В общем случае - предпочтительнее ранний возврат("early return"), где это может быть применимо. Использование `guard` условий для этих целей зачастую увеличивает читаемость кода.

```swift
// PREFERRED
func eatDoughnut(at index: Int) {
  guard index >= 0 && index < doughnuts.count else {
    // return early because the index is out of bounds
    return
  }

  let doughnut = doughnuts[index]
  eat(doughnut)
}

// NOT PREFERRED
func eatDoughnut(at index: Int) {
  if index >= 0 && index < doughnuts.count {
    let doughnut = doughnuts[index]
    eat(doughnut)
  }
}
```

* **3.11.2** Предпочтительнее использовать `guard` при unwrapping опционалов над `if` условиями, если явно не нужен выход из функции, чтобы уменьшить вложенность и отступы в исходном коде.

```swift
// PREFERRED
guard let monkeyIsland = monkeyIsland else {
  return
}
bookVacation(on: monkeyIsland)
bragAboutVacation(at: monkeyIsland)

// NOT PREFERRED
if let monkeyIsland = monkeyIsland {
  bookVacation(on: monkeyIsland)
  bragAboutVacation(at: monkeyIsland)
}

// EVEN LESS PREFERRED
if monkeyIsland == nil {
  return
}
bookVacation(on: monkeyIsland!)
bragAboutVacation(at: monkeyIsland!)
```

* **3.11.3** При принятии решения, какую конструкцию использовтаь -`if` или `guard` - в случаях,  когда unwrapping *не задействован*, главное условие - сохранять читаемость исходного кода. Возможны разные варианты таких случаев, как зависимость от двух boolean условий или сложное логическое выражение, включающее в себя несколько сравнений и тд., но важно при этом сохранять читаемость и консистентность. Если вы не уверены, `guard` или `if` будет более читаем и/или оба одинаково читаемы, предпочтительнее использовать `guard`.

```swift
// an `if` statement is readable here
if operationFailed {
  return
}

// a `guard` statement is readable here
guard isSuccessful else {
  return
}

// double negative logic like this can get hard to read - i.e. don't do this
guard !operationFailed else {
  return
}
```

* **3.11.4** Если необходимо выбрать из двух условий, предпочтительнее использовать `if` перед `guard`.

```swift
// PREFERRED
if isFriendly {
  print("Hello, nice to meet you!")
} else {
  print("You have the manners of a beggar.")
}

// NOT PREFERRED
guard isFriendly else {
  print("You have the manners of a beggar.")
  return
}

print("Hello, nice to meet you!")
```

* **3.11.5** Так же необходимо использовать `guard`, если в результате ошибки должен быть выход/завершение в текущем контексте. В примере ниже приведен блок, в котором использование двух блоков `if` имеет больше смысла, нежели `guard` - два несвязанных условия не должны блокировать выполнение друг друга.

```swift
if let monkeyIsland = monkeyIsland {
    bookVacation(onIsland: monkeyIsland)
}

if let woodchuck = woodchuck, canChuckWood(woodchuck) {
    woodchuck.chuckWood()
}
```

* **3.11.6** Часто бывают случаи, когда необходимо развернуть несколько опционалов, используя `guard`. В общем, можно скомбинировать их в один `guard`, если обработка ошибки каждого unwrap идентична (т.е. только `return`, `break`, `continue`, `throw` или `@noescape`).

```swift
// combined because we just return
guard let thingOne = thingOne,
  let thingTwo = thingTwo,
  let thingThree = thingThree else {
  return
}

// separate statements because we handle a specific error in each case
guard let thingOne = thingOne else {
  throw Error(message: "Unwrapping thingOne failed.")
}

guard let thingTwo = thingTwo else {
  throw Error(message: "Unwrapping thingTwo failed.")
}

guard let thingThree = thingThree else {
  throw Error(message: "Unwrapping thingThree failed.")
}
```

* **3.11.7** Не используйте однострочные `guard` условия.


```swift
// PREFERRED
guard let thingOne = thingOne else {
  return
}

// NOT PREFERRED
guard let thingOne = thingOne else { return }
```

### 3.12 Delegates

При обьявлении методов `delegate` придерживайтесь стиля именования принятого в UIKit, первый неназванный параметр(unnamed, `_`) должен быть источник - `delegate source`.

```swift
// PREFERRED
func namePickerView(_ namePickerView: NamePickerView, didSelectName name: String)
func namePickerViewShouldReload(_ namePickerView: NamePickerView) -> Bool

// NOT PREFERRED
func didSelectName(namePicker: NamePickerViewController, name: String)
func namePickerShouldReload() -> Bool
```

## 4. Documentation/Comments

### 4.1 Documentation

Если метод представляет собой алгоритм сложнее, чем O(1), тогда стоит задокументировать поведение метода (doc comment). Любое неочевидное поведение, грязный хак и т.д. должны быть задокументированы в исходном коде. Документацию должны содержать сложные классы/структуры/enums/протоколы и свойства. Все `public` методы/классы/свойства/константы/структуры/enums/протоколы и т.д. так же должны быть документированы в коде (учитывая, что из их названия/аргументов не очевидно поведение).

После добавления документированного комментария (doc comment) необходимо выполнить option+click на function/property/class и т.д., чтобы убедится, что форматирование корректно.

Полный список возможностей по разметке комментариев можно найти в [документации](https://developer.apple.com/library/tvos/documentation/Xcode/Reference/xcode_markup_formatting_ref/Attention.html#//apple_ref/doc/uid/TP40016497-CH29-SW1).

Guidelines:

* **4.1.1** 160 символов лимит на строку (как и в исходном коде).

* **4.1.2** Даже если doc comment занимает одну строку, используйте блок (`/** */`).

* **4.1.3** Не выделяйте отдельным префиксом `*` каждую новую строчку комментария.

* **4.1.4** Используйте новый синтаксис `- parameter` вместо старого `:param:` (важно, чтобы он был в нижнем регистре - `parameter`, а не `Parameter`). Option-click по документируемому методу поможет убедиться, что все выглядит корректно.

```swift
class Human {
  /**
   This method feeds a certain food to a person.

   - parameter food: The food you want to be eaten.
   - parameter person: The person who should eat the food.
   - returns: True if the food was eaten by the person; false otherwise.
  */
  func feed(_ food: Food, to person: Human) -> Bool {
      // ...
  }
}
```

* **4.1.5** Если вы документируете сущность, которая возвращает/бросает метод, необходимо предоставить документацию и для него, даже если в каких-либо случаях это будет дублированием/повторением.

* **4.1.6** Для сложных классов описание поведения/примеров использования необходимо. Помните, что markdown разметка валидна в Swift's комментариях. Разделение строками, маркированные списки и т.д. так же допустимы.

```swift
/**
 ## Feature Support

 This class does some awesome things. It supports:

 - Feature 1
 - Feature 2
 - Feature 3

 ## Examples

 Here is an example use case indented by four spaces because that indicates a
 code block:

   let myAwesomeThing = MyAwesomeClass()
   myAwesomeThing.makeMoney()

 ## Warnings

 There are some things you should be careful of:

 1. Thing one
 2. Thing two
 3. Thing three
 */
class MyAwesomeClass {
  /* ... */
}
```

* **4.1.7** При упоминании кода в комментарии используйте - \`

```swift
/**
 This does something with a `UIViewController`, perchance.
 - warning: Make sure that `someValue` is `true` before running this function.
 */
func myFunction() {
  /* ... */
}
```

* **4.1.8** При описании документации приветствуется краткость, где возможно.

### 4.2 Other Commenting Guidelines

* **4.2.1** Всегда оставляйте пробел после `//`.
* **4.2.2** Комментарии должны быть на отдельной строке.
* **4.2.3** При использовании `// MARK: - whatever` оставляйте пустую строку после.

```swift
class Pirate {

  // MARK: - instance properties

  private let pirateName: String

  // MARK: - initialization

  init() {
      /* ... */
  }

}
```

* **4.2.4** Допускается оставлять в комментариях ссылки на задачи, в том числе и для тех.долга.
```swift
/**
 There are some things we should refactor:
 1. Thing one
 2. Thing two

 @link http://youtrack.esoft.tech/issue/MCiOS--101
*/
```

* **4.2.5** Для операций, связанных с сторонними API или библиотеками, нужно указывать ссылки на исходную документацию вида `@see http://api.com`.


## 5. Order code in files

### 5.1 Order in files

Если вы пишете код в одном файле, то желательно придерживаться, порядка расположения в файле протоколов, структур, перечислений, классов и расширений.

```swift
protocol AnyProtocol { <#code#> }

/// struct or enum
struct AnyStruct { <#code#> }

enum AnyEnum { <#code#> }

class AnyClass { <#code#> }

extension AnyClass { <#code#> }
```

### 5.2 Order in classes

Необходимо стараться разделать переменные каждого типа на группы например UI располагать рядом с UI переменными, и отделать переводом каретки каждую группу переменных и разнородных сущностей класса.
```swift
class AnyClass {

  /// struct or enum
  struct AnyStruct { <#code#> }

  enum AnyEnum { <#code#> }

  /// var or let
  var button1: UIButton?
  let button2: UIButton?

  var textVariable: String?
  let typeConstant: AnyObject?
  /* ... */

  init() { <#code#> }
  /* ... */

  override func anyOverrideFunction() { <#code#> }
  /* ... */

  func anyFunction() { <#code#> }
  /* ... */
}
```