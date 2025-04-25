//
//  YapilacaklarKayitViewModel.swift
//  ToDoApp
//
//  Created by Meltem Ergul on 24.04.2025.
//

import Foundation
class YapilacakKayitViewModel {
    var yapilacaklarRepository = YapilacaklarRepository()
    
    func kaydet(ad:String){
        yapilacaklarRepository.kaydet(ad:ad)
    }
}
