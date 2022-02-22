import Foundation

struct TodoItem: Identifiable {
    let id: UUID
    let title: String
    let icon: Icon
    let isFavorite: Bool
    let lastModified: Date
}

extension TodoItem {
    init(title: String, icon: Icon, isFavorite: Bool) {
        self.id = .init()
        self.title = title
        self.icon = icon
        self.isFavorite = isFavorite
        self.lastModified = .now
    }
}

extension TodoItem {
    var isNotFavorite: Bool { !isFavorite }
}
