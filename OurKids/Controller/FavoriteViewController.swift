//
//  FavoriteViewController.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favTableView: UITableView!
    
    var favKinders: [KinderModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFavKindersFromDefaults()
        
        favTableView.register(UINib(nibName: "FavTableViewCell", bundle: nil), forCellReuseIdentifier: "FavCell")
        favTableView.delegate = self
        favTableView.dataSource = self
        
        print(favKinders)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favTableView.reloadData()
    }
    
    func colorForDate(_ date: String?) -> UIColor {
        guard let dateStr = date, let dateInt = Int(dateStr) else {
                return UIColor(hexCode: "ff5c82")
        }
        
        if dateInt >= 20230101 {
            return UIColor(hexCode: "00e1ff")
        } else if dateInt >= 20220101 && dateInt < 20230101 {
            return UIColor(hexCode: "ffb300")
        } else {
            return UIColor(hexCode: "ff5c82")
        }
    }
    
    func calculateInsideAir(for insideAirDate: String?) -> UIColor {
        return colorForDate(insideAirDate)
    }
    
    func calculateDisinfection(for disinfectionDate: String?) -> UIColor {
        return colorForDate(disinfectionDate)
    }

    func calculateIlluminance(for illuminanceDate: String?) -> UIColor {
        return colorForDate(illuminanceDate)
    }

    func calculateDust(for dustDate: String?) -> UIColor {
        return colorForDate(dustDate)
    }
    
    
//    func saveFavKindersToDefaults() {
//        let encoder = JSONEncoder()
//        
//        if let encoded = try? encoder.encode(favKinders) {
//            UserDefaults.standard.set(encoded, forKey: "favKinders")
//        }
//    }
    
    func loadFavKindersFromDefaults() {
        if let savedData = UserDefaults.standard.data(forKey: "favKinders") {
            let decoder = JSONDecoder()
            
            if let loadedKinders = try? decoder.decode([KinderModel].self, from: savedData) {
                favKinders = loadedKinders
            }
        }
    }
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favKinders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell", for: indexPath) as! FavTableViewCell
        
        let favKinder = favKinders[indexPath.row]
        cell.kinderNameLabel.text = favKinder.kinderName
        cell.kinderAddressLabel.text = favKinder.kinderAddress
        
        let insideAirColor = calculateInsideAir(for: favKinder.insideAir)
        let disinfectionColor = calculateDisinfection(for: favKinder.disinfection)
        let illuminanceColor = calculateIlluminance(for: favKinder.illuminanceDate)
        let dustColor = calculateDust(for: favKinder.dustDate)
        
        cell.insideAirImageVIew.backgroundColor = insideAirColor
        cell.deinfectionImageView.backgroundColor = disinfectionColor
        cell.illuminanceImageView.backgroundColor = illuminanceColor
        cell.dustImageView.backgroundColor = dustColor
        
    
        return cell
    }
}

extension FavoriteViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
            
            detailVC.kinderDetail = favKinders[indexPath.row]
            
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
