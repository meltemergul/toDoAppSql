//
//  YapilacaklarKayit.swift
//  ToDoApp
//
//  Created by Meltem Ergul on 19.04.2025.
//

import UIKit

class YapilacaklarKayit: UIViewController {
    
    @IBOutlet weak var tfYapilacak: UITextField!
    
    var yapilacakKayitViewModel = YapilacakKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func buttonEkle(_ sender: Any) {
        if let ad = tfYapilacak.text {
            yapilacakKayitViewModel.kaydet(ad:ad)
        }
    }
    
 
    
}
