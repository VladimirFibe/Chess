import Foundation

final class ChessViewModel: ObservableObject {
    @Published var pieces: [Chess] = []
    @Published var currentIndex = 0
    
    init() {
        for i in 0..<64 {
            pieces.append(Chess(id: i))
        }
        pieces[0].title = "BlackRook2"
        pieces[1].title = "BlackKnight2"
        pieces[2].title = "BlackBishop2"
        pieces[3].title = "BlackKing2"
        pieces[4].title = "BlackQueen2"
        pieces[5].title = "BlackBishop2"
        pieces[6].title = "BlackKnight2"
        pieces[7].title = "BlackRook2"
        for i in 8..<16 {
            pieces[i].title = "BlackPawn2"
        }
        pieces[56].title = "WhiteRook2"
        pieces[57].title = "WhiteKnight2"
        pieces[58].title = "WhiteBishop2"
        pieces[59].title = "WhiteKing2"
        pieces[60].title = "WhiteQueen2"
        pieces[61].title = "WhiteBishop2"
        pieces[62].title = "WhiteKnight2"
        pieces[63].title = "WhiteRook2"
        for i in 48..<56 {
            pieces[i].title = "WhitePawn2"
        }
    }
    
    func move(_ piece: Chess) {
        let index = pieces.firstIndex(where: { $0.id == piece.id}) ?? 0
        pieces[index] = pieces[currentIndex]
        pieces[currentIndex] = piece
        pieces[currentIndex].title = ""
        currentIndex = index
    }
}
