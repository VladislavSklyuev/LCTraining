import Foundation

/*
 Например, 2 записывается как II римскими цифрами, состоящими из двух единиц. 12 записывается как XII, то есть просто X + II. Число 27 записывается как XX V II, то есть XX+V+II.

 Римские цифры обычно пишутся от большей к меньшей слева направо. Однако цифра четыре не IIII. Вместо этого цифра четыре пишется как IV. Поскольку единица стоит перед пятеркой, мы вычитаем ее, получая четыре. Тот же принцип применим и к числу девять, которое пишется как IX. Есть шесть случаев, когда используется вычитание:

 I можно поставить перед V (5), чтобы получилось 4
 I можно поставить перед X (10), чтобы получилось 9
 X можно поставить перед L (50), чтобы получилось 40
 X можно поставить перед C (100), чтобы получилось 90
 C можно поставить перед D (500), чтобы получилось 400
 C можно поставить перед M (1000), чтобы получилось 900
 
 Учитывая римскую цифру, преобразуйте ее в целое число.
 
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 
 "III", "LVIII", "M CM XC IV" - 1000, 900, 90, 4
 */

class LeetViewModel: ObservableObject {
    
    @Published var num = 0
    @Published var showAlert = false
    
    func convertRoman(numberToArabic: String) {
        
        let validValues: [Character] = ["I", "V", "X", "L", "C", "D", "M"]
        
        let nums: [Character:Int] = ["I":1,
                                  "V":5,
                                  "X":10,
                                  "L":50,
                                  "C":100,
                                  "D":500,
                                  "M":1000]
        
        let uppercasedValue = numberToArabic.uppercased()
        
        var values: [Int] = [Int]()
        
        for value in uppercasedValue {
            let newValue = value.uppercased()
            
            if validValues.contains(value) {
                let num = nums[value]!
                values.append(num)
            }
        }
        //print("Raw values: \(values)")
        let valuesCount = values.count
        for (index, element) in values.enumerated() {
                
            switch element {
                
            case 1:
                let newArrayPrefix = Array(values.prefix(valuesCount))
                
                var sum = 0
                
                for i in newArrayPrefix {
                    
                    if i == 1 {
                        sum += 1
                    }
                }//Суммирование единиц в переменную sum
                
                if sum <= 3 && values.last! == 1 {
                    DispatchQueue.main.async {
                        self.num = values.reduce(0, +)
                    }
                } else if sum == 1 && valuesCount == 1 {
                    DispatchQueue.main.async {
                        self.num = element
                    }
                } else if sum == 1 {
                    break
                } else {
                    self.num = 0
                    return
                }
            case 5:
                guard index - 1 >= 0 else { continue }
                if values[index - 1] == 1 {
                    values[index] = 4
                    values[index - 1] = 0
                }
                break
            case 50:
                guard index - 1 >= 0 else { continue }
                if values[index - 1] == 10 {
                    values[index] = 40
                    values[index - 1] = 0
                }
                break
            case 10:
                guard index - 1 >= 0 else { continue }
                if values[index - 1] == 1 {
                    values[index] = 9
                    values[index - 1] = 0
                }
                break
            case 100:
                guard index - 1 >= 0 else { continue }
                if values[index - 1] == 10 {
                    values[index] = 90
                    values[index - 1] = 0
                }
                break
                
            case 500:
                guard index - 1 >= 0 else { continue }
                if values[index - 1] == 100 {
                    values[index] = 400
                    values[index - 1] = 0
                }
                break
            case 1000:
                guard index - 1 >= 0 else { continue }
                if values[index - 1] == 100 {
                    values[index] = 900
                    values[index - 1] = 0
                }
                break
            default:
                break
            }
        }

        //print(values)
        DispatchQueue.main.async {
            self.num = values.reduce(0, +)
        }
    }
}

