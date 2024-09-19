import SwiftUI

struct LongestCommonPrefixView: View {
    
    @StateObject var viewModel = LongestCommonPrefixViewModel()
    
    var body: some View {
        
        Text("LongestCommonPrefixView")
        
        Button {
            viewModel.longestCommonPrefix()
        } label: {
            Text("Go")
        }
    }
}
