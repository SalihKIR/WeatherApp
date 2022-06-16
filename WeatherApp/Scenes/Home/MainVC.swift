//
//  ViewController.swift
//  WeatherApp
//
//  Created by Salih KIR on 15.06.2022.
//

import UIKit


class MainVC: UIViewController {
    @IBOutlet weak var homeTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTabelView.delegate = self
        homeTabelView.dataSource = self
        homeTabelView.register(HomeWeatherCell.nibName, forCellReuseIdentifier: HomeWeatherCell.identifier)
        
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
