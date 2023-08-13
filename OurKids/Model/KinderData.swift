//
//  KinderData.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.
//

import UIKit

struct KinderDataWrapper: Codable {
    let childSchoolHygiene_mp: KinderData
}

struct KinderData: Codable {
    let list_total_count: Int
    let RESULT: ResultInfo
    let row: [Row]
}

struct ResultInfo: Codable {
    let CODE: String
    let MESSAGE: String
}

struct Row: Codable {
    let OFFICEEDU: String
    let SUBOFFICEEDU: String
    let KINDERCODE: String
    let KINDERNAME: String
    let ESTB_PT: String
    let ARQL_CHK_DT: String
    let ARQL_CHK_RSLT_TP_CD: String
    let FXTM_DSNF_TRGT_YN: String
    let FXTM_DSNF_CHK_DT: String
    let FXTM_DSNF_CHK_RSLT_TP_CD: String
    let TP_01: String
    let TP_02: String
    let TP_03: String
    let TP_04: String
    let UNWT_QLWT_INSC_YN: String
    let QLWT_INSC_DT: String
    let QLWT_INSC_STBY_YN: String
    let MDST_CHK_DT: String
    let MDST_CHK_RSLT_CD: String
    let ILMN_CHK_DT: String
    let ILMN_CHK_RSLT_CD: String
    let PBNTTMNG: String
    let ADDR: String
}
