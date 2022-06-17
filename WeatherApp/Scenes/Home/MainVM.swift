//
//  MainVM.swift
//  WeatherApp
//
//  Created by Salih KIR on 16.06.2022.
//

import Foundation
import Alamofire

protocol MainVMProtocol {
    //
    
}

protocol MainVMDelegate: AnyObject{
    var delegate: MainVMDelegateOutputs? {get set}
    var weatherData: APIWeather? {get set}
    func getUpcomingData()
   

  
}

protocol MainVMDelegateOutputs: AnyObject{
    func reloadTableView()
    func successHeader(_ type: MainVMOutputs)
}

enum MainVMOutputs {
    case succes(APIWeather)
    case error(String)
}

class MainVM: MainVMDelegate{
 
    var network: NetworkManager = NetworkManager()
    var weatherData: APIWeather?
    var delegate: MainVMDelegateOutputs?
    
    func getUpcomingData() {
        network.getDownloadMovie { [weak self ](response,err) in
            guard let self = self else {return}
            if let response = response {
                self.delegate?.successHeader(.succes(response))
            }else {
                
            }
        }
        self.delegate?.reloadTableView()
    }
    
    internal func successHeader(_ tpye: MainVMOutputs) {
        self.delegate?.successHeader(tpye)
    }
}
