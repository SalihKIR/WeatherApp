//
//  ViewController.swift
//  WeatherApp
//
//  Created by Salih KIR on 15.06.2022.
//

import UIKit


class MainVC: UIViewController {
 
   
    @IBOutlet weak var labelDort: UILabel!
    @IBOutlet weak var labelUc: UILabel!
    @IBOutlet weak var labelIki: UILabel!
    @IBOutlet weak var labelBir: UILabel!
    var viewmodel : MainVM = MainVM()
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.getUpcomingData()
        
    }
    
    @IBAction func testBUTTON(_ sender: Any) {
        AppRouter.shared.showDetailPage(self.navigationController, data: viewmodel.weatherData!)
        button.titleLabel?.text = viewmodel.weatherData?.request.language
        labelBir.text = viewmodel.weatherData?.current.isDay
        labelIki.text = viewmodel.weatherData?.current.observationTime
        labelUc.text = viewmodel.weatherData?.request.language
    }
}
    

extension MainVC: MainVMDelegateOutputs {
    func successHeader(_ type: MainVMOutputs) {
        switch type {
        case .succes(let lessons):
            button.titleLabel?.text = lessons.request.language
            labelBir.text = viewmodel.weatherData?.current.isDay
        case .error(let string):
            break
        }
    }
    
    
}
