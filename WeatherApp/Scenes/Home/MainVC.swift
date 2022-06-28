//
//  ViewController.swift
//  WeatherApp
//
//  Created by Salih KIR on 15.06.2022.
//

import UIKit
import SDWebImage

class MainVC: UIViewController {
    
    @IBOutlet weak var deneme: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var weatherWind: UILabel!
    @IBOutlet weak var weatherTemp: UILabel!
    var viewmodel : MainVMProtocol = MainVM()
   
    @IBOutlet weak var viewBackGround: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        viewmodel.delegate = self
        viewmodel.getUpcomingData()
        viewBackGround.backgroundColor = UIColor(patternImage: UIImage(named: "HD3")!)
        firstView.layer.cornerRadius = 10
      
        //AppRouter.shared.showDetailPage(self.navigationController, data: viewmodel.weatherData!)
    }

    @IBAction func detailButton(_ sender: Any) {
        AppRouter.shared.showDetailPage(navigationController, data: viewmodel.weatherData!)
    }
    
}
extension MainVC: MainVMDelegateOutputs {
    
    func successHeader(_ type: MainVMOutputs) {
        switch type {
        case .succes(let lessons):
            deneme.text = lessons.location.name
            print(lessons)
            guard let data = viewmodel.weatherData else { return }
            countryLabel.text = viewmodel.weatherData?.location.country
            weatherWind.text = "\(data.current.windSpeed)"
            //weatherWind.text = String(viewmodel.weatherData?.current.windSpeed)
            
            
            weatherImageView.downloaded(from: viewmodel.weatherData?.current.weatherIcons[0] ?? "")
            
           //weatherImageView.sd_imageURL(with: URL(string: viewmodel.weatherData?.current.weatherIcons))
        case .error(let string):
            break
        }
    }
    
    
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

