enum PokemonGeneration: CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight

    var starters: [String] {
        switch self {
        case .one:
            return ["Bulbasaur", "Charmander", "Squirtle"]
        case .two:
            return ["Chikorita", "Cyndaquil", "Totodile"]
        case .three:
            return ["Treecko", "Torchic", "Mudkip"]
        case .four:
            return ["Turtwig", "Chimchar", "Piplup"]
        case .five:
            return ["Snivy", "Tepig", "Oshawott"]
        case .six:
            return ["Chespin", "Fennekin", "Froakie"]
        case .seven:
            return ["Rowlet", "Litten", "Popplio"]
        case .eight:
            return ["Grookey", "Scorbunny", "Sobble"]
        }
    }

    var region: String {
        switch self {
        case .one:
            return "Kanto"
        case .two:
            return "Johto"
        case .three:
            return "Hoenn"
        case .four:
            return "Sinnoh"
        case .five:
            return "Unova"
        case .six:
            return "Kalos"
        case .seven:
            return "Alola"
        case .eight:
            return "Galar"
        }
    }
}
