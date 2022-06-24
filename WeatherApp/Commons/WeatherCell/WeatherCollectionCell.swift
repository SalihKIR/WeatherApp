//
//  WeatherCollectionCell.swift
//  WeatherApp
//
//  Created by Salih KIR on 24.06.2022.
//

import UIKit

class WeatherCollectionCell: UICollectionViewCell {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var backGraoundView: UIView!
    @IBOutlet weak var backGroundUnderView: UIView!
    @IBOutlet weak var extraValue: UILabel!
    @IBOutlet weak var centigradeValue: UILabel!
    @IBOutlet weak var cityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
