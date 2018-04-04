//
//  UpcomingBday.swift
//  BirthdayCountdown
//
//  Created by AngelikaDW on 03/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit

class UpcomingBday: UIViewController {
    
    var birthDatePassedOver: Date?
    var daysTillBirthdayPassedOver : Int?
    
    @IBOutlet weak var jeBentLabel: UILabel!
    
    @IBOutlet weak var daysToBdayLabel: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        daysToBdayLabel.text = "\(daysTillBirthdayPassedOver!)"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backPressed(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
    
}
