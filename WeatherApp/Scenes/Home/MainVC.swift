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
        homeTabelView.delegate = self
        homeTabelView.dataSource = self
        homeTabelView.register(HomeWeatherCell.nibName, forCellReuseIdentifier: HomeWeatherCell.identifier)
        
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
            homeTabelView.reloadData()
        case .error(let string):
            break
        }
    }

    func reloadTableView() {
        homeTabelView.reloadData()
    }
    
    
}





extension MainVC: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let HomeweatherCell = homeTabelView.dequeueReusableCell( withIdentifier: HomeWeatherCell.identifier, for: indexPath) as! HomeWeatherCell
        return HomeweatherCell
    }
    
    
}
