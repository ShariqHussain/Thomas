//
//  ViewController.swift
//  NotificationsTest
//
//  Created by Shariq Hussain on 13/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
              if settings.authorizationStatus == .authorized {
                  // Notifications are allowed
              }
              else {
                  // Either denied or notDetermined
                  DispatchQueue.main.async {
                      let alertController = UIAlertController(title: nil, message: "Do you want to change notifications settings?", preferredStyle: .alert)

                      let action1 = UIAlertAction(title: "Settings", style: .default) { (action:UIAlertAction) in
                          if let appSettings = NSURL(string: UIApplication.openSettingsURLString) {
                              UIApplication.shared.open(appSettings as URL, options: [:], completionHandler: nil)
                          }
                      }

                      let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
                      }

                      alertController.addAction(action1)
                      alertController.addAction(action2)
                      self.present(alertController, animated: true, completion: nil)
                  }
              }
          }
    }
}

