//
//  KinderManager.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.


import Foundation

protocol KinderManagerDelegate {
    func didUpdateKinderData(kinder: KinderData, cityCode: String)
    func didFailWithError(error: Error)
}

struct KinderManager {

    let kinderURL = "http://openapi.seoul.go.kr:8088/64656b41626879753135524477466a/json/childSchoolHygiene_"

    var delegate: KinderManagerDelegate?

    func fetchKinder(cityCode: String) {
        let urlString = "\(kinderURL)\(cityCode)/1/100"
        performRequest(urlString: urlString, cityCode: cityCode)
    }

    func performRequest(urlString: String, cityCode: String) {

        if let url = URL(string: urlString) {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }

                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)

                    self.parseJSON(kinderData: safeData, cityCode: cityCode)
                }
            }

            task.resume()

        }

    }
    
    func parseJSON(kinderData: Data, cityCode: String) {
        let decoder = JSONDecoder()
        
        do {
            let kinderDataDecoded = try decoder.decode(KinderData.self, from: kinderData)
            delegate?.didUpdateKinderData(kinder: kinderDataDecoded, cityCode: cityCode)
            
            handleData(for: cityCode, from: kinderDataDecoded)
        } catch {
            print(error)
        }
    }

    func handleData(for cityCode: String, from kinderData: KinderData) {
        var rows: [Row]?
        
        switch cityCode {
        case "gn":
            rows = kinderData.childSchoolHygiene_gn?.row
        case "gd":
            rows = kinderData.childSchoolHygiene_gd?.row
        case "gb":
            rows = kinderData.childSchoolHygiene_gb?.row
        case "gs":
            rows = kinderData.childSchoolHygiene_gs?.row
        case "ga":
            rows = kinderData.childSchoolHygiene_ga?.row
            
        case "gj":
            rows = kinderData.childSchoolHygiene_gj?.row
        case "gr":
            rows = kinderData.childSchoolHygiene_gr?.row
        case "gc":
            rows = kinderData.childSchoolHygiene_gc?.row
        case "nw":
            rows = kinderData.childSchoolHygiene_nw?.row
        case "db":
            rows = kinderData.childSchoolHygiene_db?.row
            
        case "dj":
            rows = kinderData.childSchoolHygiene_dj?.row
        case "dd":
            rows = kinderData.childSchoolHygiene_dd?.row
        case "mp":
            rows = kinderData.childSchoolHygiene_mp?.row
        case "sc":
            rows = kinderData.childSchoolHygiene_sc?.row
        case "sm":
            rows = kinderData.childSchoolHygiene_sm?.row
            
        case "sd":
            rows = kinderData.childSchoolHygiene_sd?.row
        case "sb":
            rows = kinderData.childSchoolHygiene_sb?.row
        case "sp":
            rows = kinderData.childSchoolHygiene_sp?.row
        case "yc":
            rows = kinderData.childSchoolHygiene_yc?.row
        case "yd":
            rows = kinderData.childSchoolHygiene_yd?.row
            
        case "ys":
            rows = kinderData.childSchoolHygiene_ys?.row
        case "ep":
            rows = kinderData.childSchoolHygiene_ep?.row
        case "jn":
            rows = kinderData.childSchoolHygiene_jn?.row
        case "jg":
            rows = kinderData.childSchoolHygiene_jg?.row
        case "jr":
            rows = kinderData.childSchoolHygiene_jr?.row
            
        default:
            return
        }
    }
}

