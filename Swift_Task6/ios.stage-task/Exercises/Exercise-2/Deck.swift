import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var deck = [Card]()
        
        suits.forEach { suit in
            values.forEach { value in
                deck.append(Card(suit: suit, value: value))
            }
        }
        
        return deck
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        trump = cards.last?.suit
        for (index, card) in cards.enumerated() {
            if card.suit == trump {
                cards[index].isTrump = true
            }
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        players.forEach {
            $0.hand = Array(cards.dropFirst(6))
            cards.removeFirst(6)
        }
    }

    public func setTrumpCards(for suit:Suit) {

    }
}

