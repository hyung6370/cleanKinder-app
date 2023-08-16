//
//  DetailViewController.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/15.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var mapBackView: UIView!
    
    @IBOutlet weak var kinderNameLabel: UILabel!
    
    @IBOutlet weak var kinderAddressLabel: UILabel!
    
    @IBOutlet weak var founderTypeLabel: UILabel!
    
    @IBOutlet weak var insideAirLabel: UILabel!
    @IBOutlet weak var insideAirCheckLabel: UILabel!
    
    @IBOutlet weak var disinfectionLabel: UILabel!
    @IBOutlet weak var disinfectionCheckLabel: UILabel!
    
    @IBOutlet weak var illuminanceLabel: UILabel!
    @IBOutlet weak var illuminanceDateLabel: UILabel!
    
    @IBOutlet weak var dustLabel: UILabel!
    @IBOutlet weak var dustDateLabel: UILabel!
    
    @IBOutlet weak var firstWaterLabel: UILabel!
    @IBOutlet weak var secondWaterLabel: UILabel!
    @IBOutlet weak var thirdWaterLabel: UILabel!
    
    var kinderDetail: KinderModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    func fetchData() {
        if let kinder = kinderDetail {
            kinderNameLabel.text = kinder.kinderName
            kinderAddressLabel.text = kinder.kinderAddress
            founderTypeLabel.text = kinder.founderType
            insideAirLabel.text = kinder.insideAir
            insideAirCheckLabel.text = kinder.insideAirCheck
            disinfectionLabel.text = kinder.disinfection
            disinfectionCheckLabel.text = kinder.disinfectionCheck
            illuminanceLabel.text = kinder.illuminanceDate
            illuminanceDateLabel.text = kinder.illuminanceDateCheck
            dustLabel.text = kinder.dustDate
            dustDateLabel.text = kinder.dustDateCheck
            firstWaterLabel.text = kinder.firstWater
            secondWaterLabel.text = kinder.secondWater
            thirdWaterLabel.text = kinder.thirdWater
        }
    }
    

}
