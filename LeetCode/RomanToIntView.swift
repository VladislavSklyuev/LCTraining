import SwiftUI

struct RomanToIntView: View {
    
    @StateObject var viewModel = RomanToIntegerViewModel()
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
                viewModel.convertRoman(numberToArabic: str)
            } label: {
                Text("Преобразовать число")
                    .foregroundStyle(.green)
                    .bold()
            }
        }
        .alert("Некорректный ввод", isPresented: $viewModel.showAnAlertAboutIncorrectInput) {
        }
        
    }
}
