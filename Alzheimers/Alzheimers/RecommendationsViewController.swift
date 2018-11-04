//
//  RecommendationsViewController.swift
//  Alzheimers
//
//  Created by Yubao  Zhang on 11/4/18.
//  Copyright © 2018 Ayushi Gupta. All rights reserved.
//

import UIKit

class RecommendationsViewController: UIViewController {
    
    func get_recommendations(level: Int) {
        let url = URL(string: "https://calhacks-5.appspot.com/recommendations/" + String(level))!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let val = String(data: data, encoding: .utf8)!
            let dat = val.data(using: .utf8)!
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: dat, options : .allowFragments) as? [Dictionary<String,Any>]
                {
                    for json in jsonArray {
                        print(json["description"]!)
                        // handle each json["description"]
                    }
                } else {
                    print("bad json")
                }
            } catch let error as NSError {
                print(error)
            }
        }
        
        task.resume()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
