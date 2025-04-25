//
//  YapilacaklarDetayViewModel.swift
//  ToDoApp
//
//  Created by Meltem Ergul on 24.04.2025.
//

import Foundation
class YapilacakDetayViewModel {
    var yapilacaklarRepository = YapilacaklarRepository()
    
    func guncelle(id:Int,ad:String){
        yapilacaklarRepository.guncelle(id: id, ad: ad)
    }
}
