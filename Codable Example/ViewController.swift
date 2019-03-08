//
//  ViewController.swift
//  Codable Example
//
//  Created by Jessica Lowry on 3/8/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

struct Country: Decodable{
    let name: String
    let capital: String
    let region: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //changed things
        
        let url = "https://restcountries.eu/rest/v2/all"
        
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!)
        {
            (data, response, error) in
            
            do {
                var countires = try JSONDecoder().decode([Country].self, from: data!)
                
                for country in countires{
                    print(country.name + ": " + country.capital)
                }
            } catch{
                print("We got an error")
            }
            
        }
    }


}

