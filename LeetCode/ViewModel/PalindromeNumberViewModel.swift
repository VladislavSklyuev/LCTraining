import Foundation

class PalindromeNumberViewModel: ObservableObject {
    
    func test(_ x: Int) -> Bool {
        
        let string = String(x)
        
        guard !string.contains("-") else { return false }
        
        let array = string.compactMap { Int(String($0)) }
        var arrayReversed = [Int]()
        
        for element in array.reversed() {
            arrayReversed.append(element)
        }
        
        if array == arrayReversed {
            return true
        } else {
            return false
        }
    }
}
