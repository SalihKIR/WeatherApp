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
            //button.titleLabel?.text = lessons.request.language
            viewmodel.weatherData?.current.isDay
        case .error(let string):
            break
        }
    }
}
    extension MainVC: UICollectionViewDelegate , UICollectionViewDataSource{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            <#code#>
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            <#code#>
        }
        
    }
    
}
