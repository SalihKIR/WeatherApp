//
//  ViewController.swift
//  WeatherApp
//
//  Created by Salih KIR on 15.06.2022.
//

import UIKit


class MainVC: UIViewController {
    
    var viewmodel : MainVM = MainVM()
    @IBOutlet weak var statusCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusCollectionView.delegate = self
        statusCollectionView.dataSource = self
        statusCollectionView.register(WeatherCollectionCell.self, forCellWithReuseIdentifier: "WeatherCollectionCell")
        
        let tasarim = UICollectionViewFlowLayout()
              tasarim.sectionInset = UIEdgeInsets(top: 150, left: 30, bottom: 0, right: 30)
              tasarim.minimumLineSpacing = 0
              tasarim.minimumInteritemSpacing = 0
              
              let genislik = statusCollectionView.frame.size.width
        let hucreGenislik = (genislik-100)/1
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1)
        statusCollectionView!.collectionViewLayout = tasarim
        viewmodel.getUpcomingData()
    }

    //        AppRouter.shared.showDetailPage(self.navigationController, data: viewmodel.weatherData!)
    
}
    extension MainVC: UICollectionViewDelegate , UICollectionViewDataSource{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let weathercell = statusCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionCell", for: indexPath) as! WeatherCollectionCell
            weathercell.layer.borderColor = UIColor.systemIndigo.cgColor
            weathercell.layer.borderWidth = 0.6
            weathercell.layer.cornerRadius = 10
            
            return weathercell
        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//            {
//                return CGSize(width: 300, height: 300)
//            }
       
      
        
    }
extension MainVC: MainVMDelegateOutputs {
    func successHeader(_ type: MainVMOutputs) {
        switch type {
        case .succes(let lessons):
            viewmodel.weatherData?.current.isDay
        case .error(let string):
            break
        }
    }
}
    

