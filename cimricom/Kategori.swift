//
//  Kategori.swift
//  cimricom
//
//  Created by Burak Özkan on 1.09.2022.
//

import Foundation

class Kategori {
    var kategoriId:Int?
    var katergoriAd:String?
    var kategoriResimAd:String?
    
    init(kategoriId: Int, katergoriAd: String, kategoriResimAd: String) {
        self.kategoriId = kategoriId
        self.katergoriAd = katergoriAd
        self.kategoriResimAd = kategoriResimAd
    }
    
    
}
