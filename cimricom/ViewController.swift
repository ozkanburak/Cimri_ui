//
//  ViewController.swift
//  cimricom
//
//  Created by Burak Özkan on 31.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kategoriCollectionView: UICollectionView!
    var kategoriListesi = [Kategori]()
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let k1 = Kategori(kategoriId: 1, katergoriAd: "Elektronik, Cep Telefonu", kategoriResimAd: "bir")
        let k2 = Kategori(kategoriId: 2, katergoriAd: "Ev, Yaşam Ofis,Kırtasiye", kategoriResimAd: "iki")
        let k3 = Kategori(kategoriId: 3, katergoriAd: "Anne, Bebek, Oyuncak", kategoriResimAd: "uc")
        let k4 = Kategori(kategoriId: 4, katergoriAd: "Saat, Moda, Takı, Ayakkabı", kategoriResimAd: "dort")
        let k5 = Kategori(kategoriId: 5, katergoriAd: "Kitap, Müzik, Hobi", kategoriResimAd: "bes")
        let k6 = Kategori(kategoriId: 6, katergoriAd: "Spor, Outdoor", kategoriResimAd: "alti")
        let k7 = Kategori(kategoriId: 7, katergoriAd: "Sağlık, Bakım, Kozmetik", kategoriResimAd: "yedi")
        let k8 = Kategori(kategoriId: 8, katergoriAd: "Oto, Bahçe, Yapı Market", kategoriResimAd: "sekiz")
        let k9 = Kategori(kategoriId: 9, katergoriAd: "Petshop", kategoriResimAd: "dokuz")
        
        kategoriListesi.append(k1)
        kategoriListesi.append(k2)
        kategoriListesi.append(k3)
        kategoriListesi.append(k4)
        kategoriListesi.append(k5)
        kategoriListesi.append(k6)
        kategoriListesi.append(k7)
        kategoriListesi.append(k8)
        kategoriListesi.append(k9)
        
        kategoriCollectionView.delegate = self
        kategoriCollectionView.dataSource = self
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 15
        tasarim.minimumInteritemSpacing = 5
        let genislik = kategoriCollectionView.frame.size.width
        let itemGenislik = (genislik-40)/3
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1)
        kategoriCollectionView.collectionViewLayout = tasarim
        
        //navbar
        self.navigationItem.title = "cimri"
        
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = UIColor(named: "anaRenk")
        navbarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk")!,.font: UIFont(name: "Almarai-Regular", size: 40)!]
        navbarAppearance.configureWithOpaqueBackground()
        navbarAppearance.shadowColor = .clear
        navbarAppearance.shadowImage = UIImage()
        
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.compactAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
    
       // tabbar renk
       let appearance = UITabBarAppearance()
       appearance.backgroundColor = UIColor.white
       
       renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
       renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
       renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
       
       tabBarController?.tabBar.standardAppearance = appearance
       tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    //iconların renk değişimleri
    func renkDegistir(itemAppearance:UITabBarItemAppearance) {
        //Seçili Durum
        itemAppearance.selected.iconColor = UIColor.blue
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.blue]
        itemAppearance.selected.badgeBackgroundColor = UIColor.blue
        
        
        //seçili olmayan durum
        itemAppearance.normal.iconColor = UIColor.black
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
       
        
        
        
    }


}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kategoriListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let kategori = kategoriListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kategoriHucre", for: indexPath) as! KategoriCollectionViewCell
        
        cell.kategoriImageView.image = UIImage(named: kategori.kategoriResimAd!)
        cell.kategoriAdiLabel.text = kategori.katergoriAd
        
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
       
        
        return cell
    }
}
