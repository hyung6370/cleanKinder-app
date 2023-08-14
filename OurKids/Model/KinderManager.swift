//
//  KinderManager.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.


import Foundation

struct KinderManager {

    let kinderURL = "http://openapi.seoul.go.kr:8088/64656b41626879753135524477466a/json/childSchoolHygiene_"

    func fetchKinder(cityCode: String) {
        let urlString = "\(kinderURL)\(cityCode)/1/100"
//        print(urlString)
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

        switch cityCode {
        case "gn":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_gn?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_gn?.row[0].ADDR)
            } catch {
                print(error)
            }
        case "gd":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_gd?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_gd?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "gb":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_gb?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_gb?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "gs":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_gs?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_gs?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "ga":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_ga?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_ga?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "gj":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_gj?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_gj?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "gr":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_gr?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_gr?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "gc":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_gc?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_gc?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "nw":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_nw?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_nw?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "db":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_db?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_db?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "dj":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_dj?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_dj?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "dd":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_dd?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_dd?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "mp":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_mp?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_mp?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "sc":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_sc?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_sc?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "sm":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_sm?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_sm?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "sd":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_sd?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_sd?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "sb":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_sb?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_sb?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "sp":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_sp?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_sp?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "yc":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_yc?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_yc?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "yd":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_yd?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_yd?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "ys":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_ys?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_ys?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "ep":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_ep?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_ep?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "jn":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_jn?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_jn?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "jg":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_jg?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_jg?.row[0].ADDR)
            } catch {
                print(error)
            }

        case "jr":
            do {
                let kinderData = try decoder.decode(KinderData.self, from: kinderData)
                print(kinderData.childSchoolHygiene_jr?.row[0].KINDERNAME)
                print(kinderData.childSchoolHygiene_jr?.row[0].ADDR)
            } catch {
                print(error)
            }
        default:
            print("지원하지 않는 도시 코드입니다")
        }
    }
}


