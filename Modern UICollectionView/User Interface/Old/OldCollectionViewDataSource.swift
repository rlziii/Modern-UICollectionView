import UIKit

class OldCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    // MARK: - Private Properties
    private let pokemonGenerations = PokemonGeneration.allCases

    // MARK: - UICollectionViewDataSource Methods

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        pokemonGenerations.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        starters(for: section).count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OldCollectionViewCell.reuseIdentifier,
            for: indexPath
        )

        if let cell = cell as? OldCollectionViewCell {
            let pokemonImage = pokemonImage(for: indexPath)
            cell.configure(with: pokemonImage)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: OldCollectionViewHeader.reuseIdentifier,
            for: indexPath
        )

        if let header = header as? OldCollectionViewHeader {
            let region = region(for: indexPath.section)
            header.configure(with: region)
        }

        return header
    }

    // MARK: - Private Properties

    private func starters(for section: Int) -> [String] {
        pokemonGenerations[section].starters
    }

    private func pokemonImage(for indexPath: IndexPath) -> UIImage {
        let pokemonName = starters(for: indexPath.section)[indexPath.row]
        let imageName = pokemonName.lowercased()
        return UIImage(named: imageName)!
    }

    private func region(for section: Int) -> String {
        pokemonGenerations[section].region
    }
}
