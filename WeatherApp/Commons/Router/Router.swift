//
//  Router.swift
//  WeatherApp
//
//  Created by Salih KIR on 16.06.2022.
//

import Foundation
import UIKit

final class AppRouter {
    
    static var shared = AppRouter()
    
    init() {}
    
    func showDetailPage(_ navigationController: UINavigationController? , data: APIWeather) {
        let vc = WeatherDetailVC.instantiate(storyboard: .weatherDetail)
        let vm = WeatherDetailVM()
        vc.viewModel = vm
        vm.weatherData = data
        navigationController?.pushViewController(vc, animated: true)
    }
}
