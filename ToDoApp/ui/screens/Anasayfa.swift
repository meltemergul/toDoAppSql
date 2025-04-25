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
    var anasayfaViewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        searchBar.delegate = self
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
              
              _ = anasayfaViewModel.yapilacaklarListesi.subscribe(onNext: { liste in//Dinleme
                  self.yapilacaklarListesi = liste
                  self.yapilacaklarTableView.reloadData()
              })
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //Sayfa her göründüğünde çalışır.
        //Sayfaya geri dönüldüğünü anlayabiliriz.
       
        anasayfaViewModel.yapilacaklariYukle()
        print("viewWillAppear çalıştı.")
      
    }
    override func viewDidDisappear(_ animated: Bool) {
         //Sayfa her görünmez olduğunda çalışır.
         print("viewDidDisappear çalıştı.")
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Geçiş yapıldı")
             if segue.identifier == "toDetay" {
                 print("toDetay çalıştı")
                 //Any : bütün sınıfların üstündedir.Java Object
                 if let yapilacak = sender as? Yapilacaklar {//as? downcasting : Super class > Sub class dönüştürmektir.
                     print("Veri : \(yapilacak.name!)")
                     let gidilecekVC = segue.destination as! YapilacaklarDetay
                     //as? : downcasting,hata olma ihtimali yüksekse bunu kullanıyoruz.
                     //as! : downcasting,hata olma ihtimali düşükse bunu kullanıyoruz.
                     gidilecekVC.yapilacak = yapilacak
            }
        }
    }

}
extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaViewModel.ara(aramaKelimesi: searchText)
    }
}

extension Anasayfa :UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListesi.count
//        kaç tane satır oluşturacak
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//       satır sayısına göre tekrarlı çalışacak
        let hucre=tableView.dequeueReusableCell(withIdentifier: "yapilacaklarHucre")as! YapilacaklarHucre
//        0,1,2,3,4,5
        let yapilacak=yapilacaklarListesi[indexPath.row]
    hucre.yapilacakAd.text=yapilacak.name
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak=yapilacaklarListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacak)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction=UIContextualAction(style: .destructive, title: "Sil")
        {
            contextualAction,view,bool in //closure
            
            let yapilacak=self.yapilacaklarListesi[indexPath.row]
//        print("Kişi Sil: \(kisi.kisi_id!)")
            let alert=UIAlertController(title: "Silme İşlemi", message: "\(yapilacak.name!) silinsin mi?", preferredStyle:.alert)
            
            let iptalAction=UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction=UIAlertAction(title: "Evet", style: .destructive){
                action in print("Yapılacak Sil: \(yapilacak.id!)")
            }
            alert.addAction(evetAction)
            self.present(alert,animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
