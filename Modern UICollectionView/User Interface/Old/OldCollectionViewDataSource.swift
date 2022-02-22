import UIKit

class OldTableViewDataSource: NSObject, UITableViewDataSource {
    // MARK: - Private Properties
    private let pokemonGenerations = PokemonGeneration.allCases

    // MARK: - UITableViewDataSource Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        pokemonGenerations.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        starters(for: section).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: OldTableViewCell.reuseIdentifier,
            for: indexPath
        )

        if let cell = cell as? OldTableViewCell {
            let pokemonName = pokemonName(for: indexPath)
            let pokemonImage = pokemonImage(for: pokemonName)
            cell.configure(name: pokemonName, image: pokemonImage)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        region(for: section)
    }

    // MARK: - Private Properties

    private func starters(for section: Int) -> [String] {
        pokemonGenerations[section].starters
    }

    private func pokemonName(for indexPath: IndexPath) -> String {
        starters(for: indexPath.section)[indexPath.row]
    }

    private func pokemonImage(for name: String) -> UIImage {
        return UIImage(named: name.lowercased())!
    }

    private func region(for section: Int) -> String {
        pokemonGenerations[section].region
    }
}
