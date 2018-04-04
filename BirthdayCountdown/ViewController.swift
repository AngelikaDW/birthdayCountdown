//
//  ViewController.swift
//  BirthdayCountdown
//
//  Created by AngelikaDW on 03/04/2018.
//  Copyright © 2018 aleaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var daysDiffLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var gefeliciteerdLabel: UILabel!
    
    @IBOutlet weak var jeBentLabel: UILabel!
    
    @IBOutlet weak var dagenOudLabel: UILabel!
    
    let today = Date()
    var formattedBirthDate : Date?
    var selectedDate : Date?
    var daysTillBirthday : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gefeliciteerdLabel.isHidden = true
        jeBentLabel.isHidden = true
        dagenOudLabel.isHidden = true
        
    }

    

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        gefeliciteerdLabel.isHidden = false
        jeBentLabel.isHidden = false
        dagenOudLabel.isHidden = false
        
        
        datePicker.datePickerMode = .date
        selectedDate = datePicker.date
        
//      print("Selected Date: \(selectedDate!)")
        
        print(daysBetween(start: selectedDate!, end: today))
        daysDiffLabel.text = "\(daysBetween(start: selectedDate!, end: today))"
        
        daysTillBirthday = setUpcomingBirthday(today: today, birthDate: selectedDate!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUpcomingBday"{
            let destinationVC = segue.destination as! UpcomingBday
            destinationVC.daysTillBirthdayPassedOver = daysTillBirthday
        }
    }
    @IBAction func waneerJarigButton(_ sender: Any) {
        performSegue(withIdentifier: "goToUpcomingBday", sender: self)
        daysTillBirthday = setUpcomingBirthday(today: today, birthDate: selectedDate!)
    }
    
    func daysBetween(start: Date, end: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
    //TODO:
    /*
     first get birthday and set it to upcomingBirthday:
     compare if DD MM is <= than current date -> change year setting to currentDate Year +1
     if > -> change year setting to current Date Year
     
     second: take new var upcomingBirthday and use daysBetween func to calculate days between today and upcomingBirthday
     
     third: pass number of days over to 2nd VC
    */
    
    func setUpcomingBirthday(today: Date, birthDate: Date) -> Int {
        var upcomingBirthday : Date = birthDate
        let today = Calendar.current.startOfDay(for: today)
        
        let calendar = Calendar.current
        
        var dateComponents: DateComponents? = calendar.dateComponents([.month, .day], from: upcomingBirthday)
        
        dateComponents?.year = 2018
        
        upcomingBirthday = calendar.date(from: dateComponents!)!
        
        
        print(upcomingBirthday)
        
        if today < upcomingBirthday {
           
        } else {
            dateComponents?.year = 2019
            
            upcomingBirthday = calendar.date(from: dateComponents!)!
            
            print(upcomingBirthday)
        }
        
        return daysBetween(start: today, end: upcomingBirthday)
    
    }
    
}

