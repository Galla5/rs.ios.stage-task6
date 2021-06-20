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
        self.cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var cars: [Card] = []
        let sortedSuits = suits.sorted(by: { $0.rawValue < $1.rawValue })
        let sortedValues = values.sorted(by: { $0.rawValue < $1.rawValue })
        
        for suit in sortedSuits {
            for value in sortedValues {
                let card = Card(suit: suit, value: value)
                cars.append(card)
            }
        }
        
        return cars
    }

    public func shuffle() {

    }

    public func defineTrump() {

    }

    public func initialCardsDealForPlayers(players: [Player]) {

    }

    public func setTrumpCards(for suit:Suit) {

    }
}

