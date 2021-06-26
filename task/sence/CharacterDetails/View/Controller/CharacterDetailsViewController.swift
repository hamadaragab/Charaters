//
//  CharacterDetailsViewController.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import UIKit

class CharacterDetailsViewController: BaseViewController {

    @IBOutlet weak var nextBTN: UIButton!
    @IBOutlet weak var previousBTN: UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var characterDetailsCollectionView: UICollectionView!
    var presenter: CharacterDetailsPresenterProtocol?
    var currentIndex = 0
    var numberOfCharacters = 0
    let characterDetailsCell = "characterDetailsCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureView()
        configureCollecctionView()
       

        
    }
    private func configureCollecctionView()
    {
        characterDetailsCollectionView.delegate = self
        characterDetailsCollectionView.dataSource = self
        let characterCellNib = UINib(nibName: characterDetailsCell, bundle: nil)
        characterDetailsCollectionView.register(characterCellNib, forCellWithReuseIdentifier: characterDetailsCell)
        
    }
    private func ConfigureView()
    {
        currentIndex = presenter?.returnSelectedIndex() ?? 0
        numberOfCharacters = presenter?.returnNumberOfCharacter() ?? 0
        nextBTN.layer.cornerRadius =  previousBTN.frame.width / 2
        nextBTN.layer.masksToBounds = true
        previousBTN.layer.cornerRadius =  previousBTN.frame.width / 2
        previousBTN.layer.masksToBounds = true
        pageController.numberOfPages = numberOfCharacters
        pageController.currentPage = currentIndex
        DispatchQueue.main.async {
            self.characterDetailsCollectionView.setContentOffset(CGPoint(x: self.currentIndex * Int(self.characterDetailsCollectionView.frame.width), y: -20), animated: false)
            
        }
    }
    @IBAction func nextTapped(_ sender: Any) {
        if currentIndex == numberOfCharacters - 1 {
            }
        else {
            currentIndex = currentIndex + 1
        }
        characterDetailsCollectionView.setContentOffset(CGPoint(x:  currentIndex * Int(self.characterDetailsCollectionView.frame.width), y: -20), animated: false)
        pageController.currentPage = currentIndex
    }
    
    @IBAction func previousTapped(_ sender: Any) {
        if currentIndex == 0 {
        }
        else {
            currentIndex = currentIndex - 1
        }
        characterDetailsCollectionView.setContentOffset(CGPoint(x:  currentIndex * Int(self.characterDetailsCollectionView.frame.width), y: -20), animated: false)
        pageController.currentPage = currentIndex

    }
    
    @IBAction func backTapped(_ sender: Any) {
        presenter?.goBack()
    }
}
