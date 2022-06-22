//
//  ViewController.swift
//  WeatherApp
//
//  Created by Salih KIR on 15.06.2022.
//

import UIKit


class MainVC: UIViewController {
 
    @IBOutlet weak var homeTabelView: UITableView!
    var viewmodel : MainVM = MainVM()
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.delegate = self
        viewmodel.getUpcomingData()
        
    }
    
    @IBAction func testBUTTON(_ sender: Any) {
        AppRouter.shared.showDetailPage(self.navigationController, data: viewmodel.weatherData!)
    }
}
    

extension MainVC: MainVMDelegateOutputs {
    func successHeader(_ type: MainVMOutputs) {
        switch type {
        case .succes(let lessons):
            button.titleLabel?.text = lessons.request.language
        case .error(let string):
            break
        }
    }
    
    
}
