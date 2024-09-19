import SwiftUI

struct PalindromeView: View {
    
    @StateObject var viewModel = PalindromeNumberViewModel()
    @State private var num = ""
    
    var body: some View {
        
        TextField("", text: $num)
            .padding() // Добавляем отступы вокруг текста
            .background(Color.gray.opacity(0.2)) // Устанавливаем серый фон с прозрачностью
            .cornerRadius(10) // Закругляем углы
            .padding() // Добавляем отступы вокруг всего TextField
        Button {
            viewModel.test(Int(num) ?? 0)
        } label: {
            Text("Go!")
        }
    }
}
