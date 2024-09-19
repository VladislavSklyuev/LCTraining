import SwiftUI

struct LeetView: View {
    
    @StateObject var viewModel = LeetViewModel()
    @State private var str = ""
    
    
    var body: some View {
        
        VStack(spacing: 20) {
            HStack {
                Text("Преобразованное число - ")
                
                Text(String(viewModel.num))
                    .bold()
            }
            
            TextField("", text: $str)
                .padding()
                .frame(width: 250, height: 50)
                .border(Color.gray, width: 1)
                .cornerRadius(5)
                .padding()
            
            Button {
                viewModel.convertRoman(numberToAramic: str)
            } label: {
                Text("Преобразовать число")
                    .foregroundStyle(.green)
                    .bold()
            }
        }
        
    }
}

#Preview {
    LeetView()
}
