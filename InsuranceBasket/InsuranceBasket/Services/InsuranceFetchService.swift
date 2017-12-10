//
//  InsuranceFetchService.swift
//  InsuranceBasket
//
//  Created by Javier Quevedo on 10.12.17.
//  Copyright © 2017 Javier Quevedo. All rights reserved.
//
import Foundation
import Alamofire

class InsuranceFetchService {
    enum InsuranceServiceStatus: Int {
        case success = 0
        case connectivityIssue = 1
        case invalidData = 2
        case failed = 3
    }
    
    func getInsurances(completed:@escaping (Array<Insurance>, InsuranceServiceStatus, Error?)->Void) {
        Alamofire.request(C.InsurancesUrl).validate().responseJSON { response in
            switch response.result {
            case .success:
                let jsonDict = response.result.value as! Dictionary<String, Any>
                let insurances = self.parse(jsonDict)
                completed(insurances, .success, nil)
            case .failure(let error):
                print(error)  // log error
                completed(Array(), .failed, error)
            }
        }
    }
    
    func parse(_ json:Dictionary<String, Any>) -> Array<Insurance>{
        var insurances:Array<Insurance> = Array<Insurance>()
        let categoriesReponse = (json["query"] as! Dictionary <String, Any>)["categorymembers"]as! Array<Dictionary<String, Any>>
        categoriesReponse.forEach { (category) in
            let insurance:Insurance = Insurance(category)
            insurances.append(insurance)
            print(category)
        }
        return insurances
    }
}

