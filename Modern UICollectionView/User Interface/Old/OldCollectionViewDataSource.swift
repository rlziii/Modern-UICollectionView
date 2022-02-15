import UIKit

class OldCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    // MARK: - Private Properties
    private let pokemonGenerations = PokemonGeneration.allCases

    // MARK: - UICollectionViewDataSource Methods

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        pokemonGenerations.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonGenerations[section].starters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OldCollectionViewCell.reuseIdentifier,
            for: indexPath
        )

        if let cell = cell as? OldCollectionViewCell {
            let starter = pokemonGenerations[indexPath.section].starters[indexPath.row]
            cell.configure(with: starter)
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
            let region = pokemonGenerations[indexPath.section].region
            header.configure(with: region)
        }

        return header
    }
}
