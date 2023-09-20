//
//  ViewController.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/10.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    @IBOutlet weak var kinderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottieAnimation()
        configureUI()
    }

    func lottieAnimation() {
        let animationView: LottieAnimationView = .init(name: "homeKid")
        animationView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func configureUI() {
        kinderButton.layer.cornerRadius = 20
        kinderButton.clipsToBounds = true
    }

    @IBAction func kinderButtonTapped(_ sender: UIButton) {
        
    }
}

