//
//  WeatherDetailVM.swift
//  WeatherApp
//
//  Created by Salih KIR on 16.06.2022.
//

import Foundation
import UIKit
import Alamofire

protocol WeatherDetailVMProtocol{
    
     
}
protocol WeatherDetailVMDelegate : WeatherDetailVMProtocol{
    var delegate: MainVMDelegateOutputs? {get set}
    var weatherData: APIWeather? {get set}
    //func getUpcoming()
    
}
protocol WeatherDetailVMDelegateOutputs: AnyObject{
    
}

class WeatherDetailVM: WeatherDetailVMDelegate {
    
    var network: NetworkManager = NetworkManager()
    var weatherData: APIWeather?
    var delegate: MainVMDelegateOutputs?
    
    
  
    
}

