//
//  MovieCell.swift
//  Aflam
//
//  Created by Ilyasa Azmi on 24/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.layer.cornerRadius = 5
        
        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//extension UITableViewCell{
//    func shadowAndBorderForCell(yourTableViewCell : UITableViewCell){
//        // SHADOW AND BORDER FOR CELL
//        //yourTableViewCell.contentView.layer.cornerRadius = 5
//        yourTableViewCell.contentView.layer.borderWidth = 0.5
//        yourTableViewCell.contentView.layer.borderColor = UIColor.lightGray.cgColor
//        yourTableViewCell.contentView.layer.masksToBounds = true
//        yourTableViewCell.layer.shadowColor = UIColor.gray.cgColor
//        yourTableViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        yourTableViewCell.layer.shadowRadius = 2.0
//        yourTableViewCell.layer.shadowOpacity = 1.0
//        yourTableViewCell.layer.masksToBounds = false
//        yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect:yourTableViewCell.bounds, cornerRadius:yourTableViewCell.contentView.layer.cornerRadius).cgPath
//    }
//}
