//
//  ListTableViewCell.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/14.
//

import UIKit

protocol ListTableViewCellDelegate: AnyObject {
    func didTapHeartButton(at indexPath: IndexPath)
}

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var kinderNameLabel: UILabel!
    @IBOutlet weak var kinderAddressLabel: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var insideAirImageVIew: UIImageView!
    @IBOutlet weak var dustImageView: UIImageView!
    @IBOutlet weak var deinfectionImageView: UIImageView!
    @IBOutlet weak var illuminanceImageView: UIImageView!
    
    weak var delegate: ListTableViewCellDelegate?
    
    var isTouched: Bool? {
        didSet {
            if isTouched == true {
                heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                heartButton.tintColor = UIColor.red
            }
            else {
                heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
                heartButton.tintColor = UIColor.lightGray
            }
            guard let indexPath = getCurrentIndexPath() else { return }
            delegate?.didTapHeartButton(at: indexPath)
        }
    }
    
    
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

    
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        if heartButton.imageView?.image == UIImage(systemName: "heart") {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = UIColor.red
        }
        else {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = UIColor.lightGray
        }
        
        guard let indexPath = getCurrentIndexPath() else { return }
        delegate?.didTapHeartButton(at: indexPath)
    }
    

    private func getCurrentIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else { return nil }
        return superView.indexPath(for: self)
    }
    
}

