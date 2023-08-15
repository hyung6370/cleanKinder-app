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
    }

    func configureUI() {
        guView.layer.cornerRadius = 20
        guView.clipsToBounds = true
    }
    
    func getCityCode(forRow row: Int) -> String {

        let cityCodes: [String] = ["gn", "gd", "gb", "gs", "ga", "gj", "gr", "gc", "nw", "db", "dj", "dd", "mp", "sc", "sm", "sd", "sb", "sp", "yc", "yd", "ys", "ep", "jn", "jg", "jr"]
        return cityCodes[row]
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
        
        kinderManager.fetchKinder(cityCode: selectedCityCode)
        
    }
}


extension ListViewController: KinderManagerDelegate {
    
    func handleKinderData(rows: [Row]?) {
        guard let validRows = rows else { return }
        for rowItem in validRows {
            let name = rowItem.KINDERNAME
            let address = rowItem.ADDR
            let newKinder = KinderModel(kinderName: name, kinderAddress: address)
            kinders.append(newKinder)
        }
        print(kinders.count)
        DispatchQueue.main.async {
            self.kinderTableView.reloadData()
        }
    }

    func didUpdateKinderData(kinder: KinderData, cityCode: String) {
        print("2")
        
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
        
        return cell
    }
}
