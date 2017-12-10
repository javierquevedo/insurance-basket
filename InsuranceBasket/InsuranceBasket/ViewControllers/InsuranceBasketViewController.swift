//
//  ViewController.swift
//  InsuranceBasket
//
//  Created by Javier Quevedo on 10.12.17.
//  Copyright © 2017 Javier Quevedo. All rights reserved.
//

import Alamofire
import UIKit

class InsuranceBasketViewController: UIViewController {

    
    @IBOutlet weak var addInsuranceButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchService:InsuranceFetchService = InsuranceFetchService()
        fetchService.getInsurances { (insurances, status, error) in
            print("Javi")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == C.InsuranceSegueIdentifier {
            print("asdsa")
        }
    }
}

