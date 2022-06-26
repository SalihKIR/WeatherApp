//
//  ViewController.swift
//  WeatherApp
//
//  Created by Salih KIR on 15.06.2022.
//

import UIKit


class MainVC: UIViewController {
    @IBOutlet weak var deneme: UILabel!
    
    var viewmodel : MainVMProtocol = MainVM()
   
    @IBOutlet weak var viewBackGround: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        viewmodel.delegate = self
        viewmodel.getUpcomingData()
        viewBackGround.backgroundColor = UIColor(patternImage: UIImage(named: "cloudy.jpg")!)
        
      
        //AppRouter.shared.showDetailPage(self.navigationController, data: viewmodel.weatherData!)
    }

    
}
extension MainVC: MainVMDelegateOutputs {
    
    func successHeader(_ type: MainVMOutputs) {
        switch type {
        case .succes(let lessons):
            deneme.text = lessons.location.name
            viewmodel.weatherData?.current.isDay
            
        case .error(let string):
            break
        }
    }
}
    

