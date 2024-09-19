import SwiftUI

struct TwoSumView: View {
    
    @StateObject var viewModel = TwoSumViewModel()
    @State private var array: String = ""
    @State private var target: String = ""
    
    var body: some View {
        
        VStack {
            Text("Result")
                .bold()
            Text(viewModel.result)
                .foregroundStyle(.green)
                .bold()
        }
        
        VStack {
            TextField("", text: $array, prompt: Text("Array"))
                .padding(.vertical, 10)
            TextField("", text: $target, prompt: Text("Target"))
            
            Button {
                viewModel.twoSum(array, target)
            } label: {
                Text("Test TwoSum")
                    .foregroundStyle(viewModel.falseConvert ? .red : .blue)
            }
        }
        .padding(.horizontal)
    }
}

