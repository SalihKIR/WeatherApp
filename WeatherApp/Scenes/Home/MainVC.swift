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
        
        viewmodel.getUpcomingData()
        
    }
    
    //    @IBAction func testBUTTON(_ sender: Any) {
    //        AppRouter.shared.showDetailPage(self.navigationController, data: viewmodel.weatherData!)
    //
    //    }
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
    extension MainVC: UICollectionViewDelegate , UICollectionViewDataSource{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let weathercell = statusCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionCell", for: indexPath)
           // weathercell.layer.borderColor = UIColor.systemIndigo.cgColor
//            weathercell.layer.borderWidth = 0.3
//            weathercell.layer.cornerRadius = 10
            
            return weathercell
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
            {
                return CGSize(width: 100, height: 100)
            }
        
    }
    

