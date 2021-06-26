//
//  characterDetailsCell.swift
//  task
//
//  Created by Apple on 6/26/21.
//

import UIKit

class characterDetailsCell: UICollectionViewCell,characterDetailsCellProtocol {
   
    @IBOutlet weak var characterPhoto: UIImageView!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDate: UILabel!
    @IBOutlet weak var characterNickName: UILabel!
    func setCharacterPhoto(photo: String) {
        characterPhoto.loadImageFrom(imgUrl: photo)
    }
    func setDescription(description: String) {
        characterDescription.text = description
    }
    
    func setName(name: String) {
        characterName.text = name
    }
    
    func setNickName(nickName: String) {
        characterNickName.text = nickName
    }
    
    func setDate(date: String) {
        characterDate.text = date
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        // Initialization code
    }
    private func configureCell()
    {
        
    }

}

protocol characterDetailsCellProtocol: AnyObject {
    func setDescription(description: String)
    func setName(name: String)
    func setNickName(nickName:String)
    func setDate(date:String)
    func setCharacterPhoto(photo: String)
}
