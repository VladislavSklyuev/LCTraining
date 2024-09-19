import SwiftUI


class TwoSumViewModel: ObservableObject {
    
    @Published var falseConvert = false
    @Published var result: String = ""
    
    @discardableResult
    func twoSum(_ nums: String, _ target: String) -> [Int] {
        
        var result = [Int]()
        
        let newTarget = Int(target)
        
        let arr = nums.split(separator: ",").compactMap { Int($0) }
        print(arr)
        
    outerLoop: for (i,v) in arr.enumerated() {
        
        for (ind, val) in arr.enumerated() {
            guard i != ind else { continue }
            if (v + val == newTarget) {
                result.append(arr.firstIndex(of: v)!)
                result.append(arr.lastIndex(of: val)!)
                break outerLoop
            }
            
        }
    }
        if result.isEmpty {
            falseConvert = true
        } else {
            falseConvert = false
        }
        
        var newStr = ""
            for ch in result {
                newStr += String(ch)
                
                newStr += ","
            }
        
        if !newStr.isEmpty {
            newStr.remove(at: newStr.lastIndex(of: ",")!)
        }
        
        DispatchQueue.main.async {
            self.result = newStr
        }
        
        print(newStr)
        print(result)
        return result
    }
}
