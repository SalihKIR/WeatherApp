//
//  HomeWeatherCell.swift
//  WeatherApp
//
//  Created by Salih KIR on 16.06.2022.
//

import UIKit

class HomeWeatherCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
extension HomeWeatherCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
