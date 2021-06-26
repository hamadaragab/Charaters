//
//  CharacterDetailsViewExtension.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
import UIKit
extension CharacterDetailsViewController: CharacterDetailsViewProtocol{
   
}
extension CharacterDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.returnNumberOfCharacter() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterDetailsCell, for: indexPath) as! characterDetailsCell
        presenter?.configureCell(index: indexPath.row, cell: cell)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.characterDetailsCollectionView.frame.width, height: self.characterDetailsCollectionView.frame.height + 20)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in characterDetailsCollectionView.visibleCells {
          if let row = characterDetailsCollectionView.indexPath(for: cell)?.item {
            self.currentIndex = row
            pageController.currentPage = currentIndex
          }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
