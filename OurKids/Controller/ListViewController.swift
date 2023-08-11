//
//  ListViewController.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.
//

import UIKit
import CRPickerButton

class ListViewController: UIViewController {
    

    @IBOutlet weak var guView: UIView!
    @IBOutlet weak var guLabel: UILabel!
    @IBOutlet weak var guPickerView: UIPickerView!
    
    var kinderManager = KinderManager()
    
    var guList: [String] = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.black

        configureUI()
        
        guPickerView.delegate = self
        guPickerView.dataSource = self
    }


    
    func configureUI() {
        guView.layer.cornerRadius = 20
        guView.clipsToBounds = true
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
        let selectedGu = guList[row]
        guLabel.text = selectedGu
        print(selectedGu)
    }
}

