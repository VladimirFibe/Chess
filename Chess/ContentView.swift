import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ChessViewModel()
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 8)
    var body: some View {
        ZStack {
            Image("ChessBoard")
                .resizable()
                .scaledToFit()
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(viewModel.pieces) { piece in
                    ZStack {
                        if !piece.title.isEmpty {
                            Image(piece.title)
                                .resizable()
                                .scaledToFit()
                        } else {
                            Circle().fill(Color.clear)
                        }
                    }
                    .aspectRatio(1, contentMode: .fill)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.4)) {
                            viewModel.move(piece)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
