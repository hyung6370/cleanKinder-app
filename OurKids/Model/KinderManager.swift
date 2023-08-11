//
//  KinderManager.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.
//

import Foundation

struct KinderManager {
    
//    let kinderURL = "http://openapi.seoul.go.kr:8088/64656b41626879753135524477466a/json/childSchoolHygiene_gn/1/43/"
    
    let kinderURL = "http://openapi.seoul.go.kr:8088/64656b41626879753135524477466a/json/"
   
    
    func fetchKinder(cityCode: String) {
        let urlString = "\(kinderURL)/\(cityCode)"
    }
    
}
