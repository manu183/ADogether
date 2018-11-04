//
//  QuestionViewController.swift
//  Alzheimers
//
//  Created by Yubao  Zhang on 11/3/18.
//  Copyright © 2018 Ayushi Gupta. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var questionArray = [String]()
    var currentQuestionIndex = 0
    

    @IBOutlet weak var Qs: UILabel!
    
    @IBAction func Yes(_ sender: UIButton) {
         self.Qs.text = self.questionArray[self.currentQuestionIndex]
        self.currentQuestionIndex+=1
        if self.currentQuestionIndex == 5
        {
            performSegue(withIdentifier: "ToRecommendationSegue", sender: self)
        }
        
    }
    @IBAction func No(_ sender: UIButton) {
         self.Qs.text = self.questionArray[self.currentQuestionIndex]
        self.currentQuestionIndex+=1
        if self.currentQuestionIndex == 5
        {
            performSegue(withIdentifier: "ToRecommendationSegue", sender: self)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        get_questions()
        // Do any additional setup after loading the view.
    }
    
    func get_questions() {
        let url = URL(string: "https://calhacks-5.appspot.com/patients/5bdd73081c9d440000697596/questions")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let val = String(data: data, encoding: .utf8)!
            for question in val.components(separatedBy: ",") {
                
                var test = question.replacingOccurrences(of: "[", with: "", options: NSString.CompareOptions.literal, range: nil)
                test = test.replacingOccurrences(of: "]", with: "", options: NSString.CompareOptions.literal, range: nil)
                let question = test.replacingOccurrences(of: "\"", with: "")
                
                self.questionArray.append(question)
                self.questionArray.shuffle()
                self.questionArray = Array(self.questionArray.prefix(5))
            }
            
            DispatchQueue.main.async {
                self.Qs.text = self.questionArray[self.currentQuestionIndex]
                self.currentQuestionIndex+=1
            }
        }
        
        task.resume()
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
