//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Salih KIR on 16.06.2022.
//

import Foundation
import UIKit
import Alamofire

class NetworkManager{
    
    init() { }
    
    static let upComing = "http://api.weatherstack.com/current?access_key=9fb8e3416811aca0a483109cb729109a&query=london"
    
    func getDownloadMovie( completion: @escaping (APIWeather? , String ) -> Void) {
        
        AF.request("http://api.weatherstack.com/current?access_key=9fb8e3416811aca0a483109cb729109a&query=london")
            .validate()
            .responseDecodable(of: APIWeather.self) { [weak self] (response) in
                if let movies = response.value {
                    completion(movies , "")
                } else {
                    completion(nil, response.error?.localizedDescription ?? "")
                }
            }
    }
    
}
