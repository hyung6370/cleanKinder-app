//
//  KinderManager.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.
//

import Foundation

struct KinderManager {
        
    let kinderURL = "http://openapi.seoul.go.kr:8088/64656b41626879753135524477466a/json/childSchoolHygiene_"
    
    func fetchKinder(cityCode: String) {
        let urlString = "\(kinderURL)\(cityCode)/1/100"
        print(urlString)
        self.performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                    
                    self.parseJSON(kinderData: safeData)
                }
            }

            task.resume()
            
        }

    }
    
    func parseJSON(kinderData: Data) {
        
    }
    
}




