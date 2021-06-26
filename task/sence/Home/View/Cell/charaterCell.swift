//
//  charaterCell.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import UIKit

class charaterCell: UITableViewCell,charaterCellProtocol {
   
    @IBOutlet weak var bottomLAb: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var charaterIamge: UIImageView!
    @IBOutlet weak var characterNAme: UILabel!
    @IBOutlet weak var arrow: UIButton!
    @IBOutlet weak var characterNickName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        // Initialization code
    }
    func displayCharacter(image: String) {
        charaterIamge.loadImageFrom(imgUrl: image)
    }
    func characterName(name: String) {
        characterNAme.text = name
    }
    
    
    private func configureCell()
    {
        charaterIamge.layer.cornerRadius = self.charaterIamge.frame.width / 2
        charaterIamge.layer.masksToBounds = true
        containerView.layer.cornerRadius = 7
        containerView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

protocol charaterCellProtocol: AnyObject {
    func displayCharacter(image: String)
    func characterName(name: String)
}
