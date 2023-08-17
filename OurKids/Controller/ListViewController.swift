//
//  ListViewController.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var guView: UIView!
    @IBOutlet weak var guLabel: UILabel!
    @IBOutlet weak var guPickerView: UIPickerView!
    
    @IBOutlet weak var kinderTableView: UITableView!
    
    var kinderManager = KinderManager()
    
    var kinders: [KinderModel] = []
    var favKinders: [KinderModel] = []
    
    var guList: [String] = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동작구", "동대문구", "마포구", "서초구", "서대문구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.black

        configureUI()
        
        guPickerView.delegate = self
        guPickerView.dataSource = self
        
        kinderTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "KinderCell")
        kinderTableView.delegate = self
        kinderTableView.dataSource = self
        
        kinderManager.delegate = self
        
        initialData()
    }

    func configureUI() {
        guView.layer.cornerRadius = 20
        guView.clipsToBounds = true
    }
    
    func initialData() {
        guLabel.text = guList[0]
        guPickerView.selectRow(0, inComponent: 0, animated: true)
        kinderManager.fetchKinder(cityCode: getCityCode(forRow: 0))
        
        kinderTableView.separatorColor = UIColor(hexCode: "ff7b00")
    }
    
    func getCityCode(forRow row: Int) -> String {

        let cityCodes: [String] = ["gn", "gd", "gb", "gs", "ga", "gj", "gr", "gc", "nw", "db", "dj", "dd", "mp", "sc", "sm", "sd", "sb", "sp", "yc", "yd", "ys", "ep", "jn", "jg", "jr"]
        return cityCodes[row]
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
}

extension ListViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // UIPickerViewDataSource 메서드 - 컴포넌트 내 row 개수를 설정합니다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return guList.count
    }

    // UIPickerViewDelegate 메서드 - 선택한 row의 내용을 보여줍니다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return guList[row]
    }

    // UIPickerViewDataSource 메서드 - 컴포넌트 개수를 설정합니다.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // 예시로 1개의 컴포넌트를 생성
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCityCode = getCityCode(forRow: row)
        let selectedGu = guList[row]
        guLabel.text = selectedGu
        
        kinders.removeAll()
        
        kinderManager.fetchKinder(cityCode: selectedCityCode)
    }
}


extension ListViewController: KinderManagerDelegate {
    
    func handleKinderData(rows: [Row]?) {
        guard let validRows = rows else { return }
        for rowItem in validRows {
            let name = rowItem.KINDERNAME
            let address = rowItem.ADDR
            let founderType = rowItem.ESTB_PT
            
            let insideAir = rowItem.ARQL_CHK_DT
            let insideAirCheck = rowItem.ARQL_CHK_RSLT_TP_CD
            
            let disinfection = rowItem.FXTM_DSNF_CHK_DT
            let disinfectionCheck = rowItem.FXTM_DSNF_CHK_RSLT_TP_CD
            
            let illuminanceDate = rowItem.ILMN_CHK_DT
            let illuminanceDateCheck = rowItem.ILMN_CHK_RSLT_CD
            
            let dustDate = rowItem.MDST_CHK_DT
            let dustDateCheck = rowItem.MDST_CHK_RSLT_CD
            
            let firstWater = rowItem.TP_01
            let secondWater = rowItem.TP_02
            let thirdWater = rowItem.TP_03
            
            let newKinder = KinderModel(kinderName: name, kinderAddress: address, founderType: founderType, insideAir: insideAir, insideAirCheck: insideAirCheck, disinfection: disinfection, disinfectionCheck: disinfectionCheck, illuminanceDate: illuminanceDate, illuminanceDateCheck: illuminanceDateCheck, dustDate: dustDate, dustDateCheck: dustDateCheck, firstWater: firstWater, secondWater: secondWater, thirdWater: thirdWater)
            kinders.append(newKinder)
        }
        DispatchQueue.main.async {
            self.kinderTableView.reloadData()
        }
    }

    func didUpdateKinderData(kinder: KinderData, cityCode: String) {
        
        switch cityCode {
        case "gn":
            handleKinderData(rows: kinder.childSchoolHygiene_gn?.row)
        case "gd":
            handleKinderData(rows: kinder.childSchoolHygiene_gd?.row)
        case "gb":
            handleKinderData(rows: kinder.childSchoolHygiene_gb?.row)
        case "gs":
            handleKinderData(rows: kinder.childSchoolHygiene_gs?.row)
        case "ga":
            handleKinderData(rows: kinder.childSchoolHygiene_ga?.row)
            
        case "gj":
            handleKinderData(rows: kinder.childSchoolHygiene_gj?.row)
        case "gr":
            handleKinderData(rows: kinder.childSchoolHygiene_gr?.row)
        case "gc":
            handleKinderData(rows: kinder.childSchoolHygiene_gc?.row)
        case "nw":
            handleKinderData(rows: kinder.childSchoolHygiene_nw?.row)
        case "db":
            handleKinderData(rows: kinder.childSchoolHygiene_db?.row)
            
        case "dj":
            handleKinderData(rows: kinder.childSchoolHygiene_dj?.row)
        case "dd":
            handleKinderData(rows: kinder.childSchoolHygiene_dd?.row)
        case "mp":
            handleKinderData(rows: kinder.childSchoolHygiene_mp?.row)
        case "sc":
            handleKinderData(rows: kinder.childSchoolHygiene_sc?.row)
        case "sm":
            handleKinderData(rows: kinder.childSchoolHygiene_sm?.row)
            
        case "sd":
            handleKinderData(rows: kinder.childSchoolHygiene_sd?.row)
        case "sb":
            handleKinderData(rows: kinder.childSchoolHygiene_sb?.row)
        case "sp":
            handleKinderData(rows: kinder.childSchoolHygiene_sp?.row)
        case "yc":
            handleKinderData(rows: kinder.childSchoolHygiene_yc?.row)
        case "yd":
            handleKinderData(rows: kinder.childSchoolHygiene_yd?.row)
            
        case "ys":
            handleKinderData(rows: kinder.childSchoolHygiene_ys?.row)
        case "ep":
            handleKinderData(rows: kinder.childSchoolHygiene_ep?.row)
        case "jn":
            handleKinderData(rows: kinder.childSchoolHygiene_jn?.row)
        case "jg":
            handleKinderData(rows: kinder.childSchoolHygiene_jg?.row)
        case "jr":
            handleKinderData(rows: kinder.childSchoolHygiene_jr?.row)
            
        default:
            print("지원하지 않는 도시 코드 입니다.")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return kinders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KinderCell", for: indexPath) as! ListTableViewCell

        let kinder = kinders[indexPath.row]
        cell.kinderNameLabel.text = kinder.kinderName
        cell.kinderAddressLabel.text = kinder.kinderAddress
        
        
        let insideAirColor = calculateInsideAir(for: kinder.insideAir)
        let disinfectionColor = calculateDisinfection(for: kinder.disinfection)
        let illuminanceColor = calculateIlluminance(for: kinder.illuminanceDate)
        let dustColor = calculateDust(for: kinder.dustDate)
        
        cell.insideAirImageVIew.backgroundColor = insideAirColor
        cell.deinfectionImageView.backgroundColor = disinfectionColor
        cell.illuminanceImageView.backgroundColor = illuminanceColor
        cell.dustImageView.backgroundColor = dustColor
        
        cell.delegate = self
        
        if favKinders.contains(where: { $0.kinderName == kinder.kinderName }) {
            cell.isTouched = true
        }
        else {
            cell.isTouched = false
        }
        
        return cell
    }
}

extension ListViewController: ListTableViewCellDelegate {
    func didTapHeartButton(at indexPath: IndexPath) {
        let selectedKinder = kinders[indexPath.row]
                
        if let index = favKinders.firstIndex(where: { $0.kinderName == selectedKinder.kinderName }) {
            print("Found kinder at index \(index)")
            favKinders.remove(at: index)
            print("삭제 완료")
        }
        else {
            favKinders.append(selectedKinder)

            if let favKinder = favKinders.last {
                print("\(favKinder.kinderName) 추가")
                print(favKinders)
            }
        }
        
        // UITabBarController의 자식 ViewControllers에 직접 접근하여 데이터를 설정
        if let tabBarController = self.tabBarController,
           let viewControllers = tabBarController.viewControllers,
           let favoriteVC = viewControllers[1] as? FavoriteViewController {
            favoriteVC.favKinders = self.favKinders
        }
    }
}

extension UIColor {

    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

extension ListViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
            
            detailVC.kinderDetail = kinders[indexPath.row]
            
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
