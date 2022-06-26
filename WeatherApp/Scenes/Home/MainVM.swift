//
//  MainVM.swift
//  WeatherApp
//
//  Created by Salih KIR on 16.06.2022.
//

import Foundation
import Alamofire

protocol MainVMProtocol: AnyObject{
    var delegate: MainVMDelegateOutputs? {get set}
    var weatherData: APIWeather? {get set}
    func getUpcomingData()
}

protocol MainVMDelegateOutputs{
    func successHeader(_ type: MainVMOutputs)
}

enum MainVMOutputs {
    case succes(APIWeather)
    case error(String)
}

class MainVM: MainVMProtocol {
 
    var network: NetworkManager = NetworkManager()
    var weatherData: APIWeather?
    var delegate: MainVMDelegateOutputs?
    
    func getUpcomingData() {
        network.getDownloadMovie { [weak self ](response,err) in
            guard let self = self else {return}
            if let response = response {
                self.weatherData = response
                self.delegate?.successHeader(.succes(response))
            }else {
                print(err)
            }
        }
    }
    
     func successHeader(_ tpye: MainVMOutputs) {
         DispatchQueue.main.async {
             self.delegate?.successHeader(tpye)

         }
    }
}
