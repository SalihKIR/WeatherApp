//
//  MainVM.swift
//  WeatherApp
//
//  Created by Salih KIR on 16.06.2022.
//

import Foundation
import Alamofire

protocol MainVMProtocol {
    
}

protocol MainVMDelegate: MainVMProtocol{
    var delegate: MainVMDelegateOutputs? {get set}
    
}

protocol MainVMDelegateOutputs: AnyObject{
    
}


class MainVM: MainVMDelegate{
    var delegate: MainVMDelegateOutputs?
    
    
}
