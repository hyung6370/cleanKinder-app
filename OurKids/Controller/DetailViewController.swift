//
//  DetailViewController.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/15.
//

import UIKit
import GoogleMaps

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
    
    private var mapView: GMSMapView!
    
    var kinderDetail: KinderModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGoogleMaps()
        fetchData()
        configureUI()
    }
    
    func configureUI() {
        mapBackView.layer.borderWidth = 1.5
        mapBackView.layer.borderColor = UIColor.systemYellow.cgColor
        mapBackView.layer.cornerRadius = 15
        mapBackView.clipsToBounds = true
    }
    
    func setupGoogleMaps() {
        let camera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 16.0)
        mapView = GMSMapView.map(withFrame: self.mapBackView.bounds, camera: camera)
        self.mapBackView.addSubview(mapView)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = false
        mapView.settings.setAllGesturesEnabled(true)
    }
    
    func updateMapWithAddress(address: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemark = placemarks?.first, let location = placemark.location else {
                print("Error fetching coordinates for address: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let coordinate = location.coordinate
            let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 16.0)
            self.mapView.camera = camera
            let marker = GMSMarker(position: coordinate)
            marker.map = self.mapView
        }
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
            
            updateMapWithAddress(address: kinder.kinderAddress)
        }
    }
}
