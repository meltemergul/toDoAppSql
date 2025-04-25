//
//  YapilacaklarDetay.swift
//  ToDoApp
//
//  Created by Meltem Ergul on 19.04.2025.
//

import UIKit

class YapilacaklarDetay: UIViewController {

    @IBOutlet weak var tfYapilacakAd: UITextField!
    
    var yapilacakDetayViewModel = YapilacakDetayViewModel()
     
     var yapilacak:Yapilacaklar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tempYapilacak = yapilacak {
                 tfYapilacakAd.text = tempYapilacak.name 
               
             }
    }

  
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ad = tfYapilacakAd.text,let tempYapilacak = yapilacak {
                  yapilacakDetayViewModel.guncelle(id: tempYapilacak.id!, ad: ad,)
              }
    }
}
