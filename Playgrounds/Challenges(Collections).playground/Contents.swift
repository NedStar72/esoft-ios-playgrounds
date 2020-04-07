/*
 1. Find the median
 
 Напишите extension для коллекции, который принимает массив Int
 и возвращает медианное значение или nil, если значений нет.
 */

extension Collection where Iterator.Element == Int {
  func challenge1() -> Double? {
    
    // yor code goes here...
    // dont forget override return
    return nil
  }
}

assert([1, 2, 3].challenge1() == 2, "Challenge 1 failed")
assert([1, 2, 9].challenge1() == 2, "Challenge 1 failed")
assert([1, 3, 5, 7, 9].challenge1() == 5, "Challenge 1 failed")
assert([1, 2, 3, 4].challenge1() == 2.5, "Challenge 1 failed")
assert([Int]().challenge1() == nil, "Challenge 1 failed")

/*
 2. Missing numbers in array
 
 Напишите метод, который принимает массив из чисел 1 до 100,
 в котором от 0 до n значений могут отсутствовать,
 и возвращает массив отсутствующих чисел.
 
 Hint #1: Необходимо расширить тип Collection
 Hint #2: Функция преобразования должна принимать Iterator.Element, но возвращать обобщенный (Generic) тип
 Hint #3: Можно вычислить разницу между двумя Set, используя symmetricDifference()
 */

func challenge2(input: [Int]) -> [Int] {
  // yor code goes here...
  // dont forget override return
  return []
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)
assert(challenge2(input: testArray) == [7, 21, 26], "Challenge 2 failed")


/*
 3. Recreate map()
 
 Напишите extension для коллекции, который повторяет map().
 
 Hint #1: Самое простое (наивное) решение строится на массивах, но оно достаточно медленное
 Hint #2: Можно попробовать Set, который имеет метод contains(), который значительно быстрее
 Hint #3: Нужно помнить, что функция преобразования может выбросить ошибку (throw),
          но вы не должны обрабатывать ее в методе преобразования
 Hint #4: Стоит использовать rethrows, чтобы не раздражать пользователей, которые используют non-throwing функции
 */

// расскомментируйте aasert когда напишите метод challenge3
// assert([1, 2, 3].challenge3 { String($0) } == ["1", "2", "3"], "Challenge 3 failed")
// assert(["1", "2", "3"].challenge3 { Int($0)! } == [1, 2, 3], "Challenge 3 failed")


