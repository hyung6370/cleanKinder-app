//
//  KinderData.swift
//  OurKids
//
//  Created by KIM Hyung Jun on 2023/08/11.
//

import UIKit

struct KinderData: Codable {
    let childSchoolHygiene_gn: ChildSchoolHygiene_gn?
    let childSchoolHygiene_gd: ChildSchoolHygiene_gd?
    let childSchoolHygiene_gb: ChildSchoolHygiene_gb?
    let childSchoolHygiene_gs: ChildSchoolHygiene_gs?
    let childSchoolHygiene_ga: ChildSchoolHygiene_ga?
    
    let childSchoolHygiene_gj: ChildSchoolHygiene_gj?
    let childSchoolHygiene_gr: ChildSchoolHygiene_gr?
    let childSchoolHygiene_gc: ChildSchoolHygiene_gc?
    let childSchoolHygiene_nw: ChildSchoolHygiene_nw?
    let childSchoolHygiene_db: ChildSchoolHygiene_db?
    
    let childSchoolHygiene_dj: ChildSchoolHygiene_dj?
    let childSchoolHygiene_dd: ChildSchoolHygiene_dd?
    let childSchoolHygiene_mp: ChildSchoolHygiene_mp?
    let childSchoolHygiene_sc: ChildSchoolHygiene_sc?
    let childSchoolHygiene_sm: ChildSchoolHygiene_sm?
    
    let childSchoolHygiene_sd: ChildSchoolHygiene_sd?
    let childSchoolHygiene_sb: ChildSchoolHygiene_sb?
    let childSchoolHygiene_sp: ChildSchoolHygiene_sp?
    let childSchoolHygiene_yc: ChildSchoolHygiene_yc?
    let childSchoolHygiene_yd: ChildSchoolHygiene_yd?
    
    let childSchoolHygiene_ys: ChildSchoolHygiene_ys?
    let childSchoolHygiene_ep: ChildSchoolHygiene_ep?
    let childSchoolHygiene_jn: ChildSchoolHygiene_jn?
    let childSchoolHygiene_jg: ChildSchoolHygiene_jg?
    let childSchoolHygiene_jr: ChildSchoolHygiene_jr?
}

struct ChildSchoolHygiene_gn: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_gd: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_gb: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_gs: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_ga: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_gj: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_gr: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_gc: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_nw: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_db: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_dj: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_dd: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_mp: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_sc: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_sm: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_sd: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_sb: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_sp: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_yc: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_yd: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_ys: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_ep: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_jn: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_jg: Codable {
    let list_total_count: Int
    let row: [Row]
}

struct ChildSchoolHygiene_jr: Codable {
    let list_total_count: Int
    let row: [Row]
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






//enum APIEndpoint: String {
//    case gn
//    case gd
//    case gb
//    case gs
//    case ga
//
//    case gj
//    case gr
//    case gc
//    case nw
//    case db
//
//    case dj
//    case dd
//    case mp
//    case sc
//    case sm
//
//    case sd
//    case sb
//    case sp
//    case yc
//    case yd
//
//    case ys
//    case ep
//    case jn
//    case jg
//    case jr
//}
