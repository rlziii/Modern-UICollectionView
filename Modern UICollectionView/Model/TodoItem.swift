import Foundation

struct TodoItem: Identifiable, Hashable {
    let id: UUID
    let title: String
    let icon: Icon
    let isFavorite: Bool
}

extension TodoItem {
    init(title: String, icon: Icon, isFavorite: Bool) {
        self.id = .init()
        self.title = title
        self.icon = icon
        self.isFavorite = isFavorite
    }
}

extension TodoItem {
    var isNotFavorite: Bool { !isFavorite }
}
