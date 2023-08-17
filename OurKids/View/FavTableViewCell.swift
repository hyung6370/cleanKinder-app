//
//  FavTableViewCell.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/17.
//

import UIKit

class FavTableViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var kinderNameLabel: UILabel!
    @IBOutlet weak var kinderAddressLabel: UILabel!
    
    @IBOutlet weak var insideAirImageVIew: UIImageView!
    @IBOutlet weak var dustImageView: UIImageView!
    @IBOutlet weak var deinfectionImageView: UIImageView!
    @IBOutlet weak var illuminanceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI() {
        insideAirImageVIew.layer.cornerRadius = 7
        insideAirImageVIew.clipsToBounds = true
        
        dustImageView.layer.cornerRadius = 7
        dustImageView.clipsToBounds = true
        
        deinfectionImageView.layer.cornerRadius = 7
        deinfectionImageView.clipsToBounds = true
        
        illuminanceImageView.layer.cornerRadius = 7
        illuminanceImageView.clipsToBounds = true
    }
    
}
