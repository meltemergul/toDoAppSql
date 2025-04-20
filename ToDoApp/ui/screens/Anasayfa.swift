//
//  Anasayfa.swift
//  ToDoApp
//
//  Created by Meltem Ergul on 19.04.2025.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var yapilacaklarTableView: UITableView!
    var yapilacaklarListesi=[Yapilacaklar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//    searchBar.delegate=self
//   yapilacaklarTableView.delegate=self
//  yapilacaklarTableView.dataSource=self
        let y1=Yapilacaklar(id: 1, ad: "temizlik")
        let y2=Yapilacaklar(id: 2, ad: "yemek")
        yapilacaklarListesi.append(y1);
        yapilacaklarListesi.append(y2);
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toDetay"{
            if let yapilacak=sender as? Yapilacaklar{
                let gidilecekVC=segue.destination as! YapilacaklarDetay
         
            }
        }
    }

}
