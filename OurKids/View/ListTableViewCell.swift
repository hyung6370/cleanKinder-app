//
//  ListTableViewCell.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/14.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var kinderNameLabel: UIStackView!
    @IBOutlet weak var kinderAddressLabel: UIStackView!
    
    @IBOutlet weak var heartButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
