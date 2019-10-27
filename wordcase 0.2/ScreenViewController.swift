//
//  ScreenViewController.swift
//  wordcase 0.2
//
//  Created by 新谷修平 on 2019/10/26.
//  Copyright © 2019 Shuhei Shintani. All rights reserved.
//

import UIKit

class ScreenViewController: UIViewController {

    var screenContentList = [String]()
    var i = 0
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        screenContentList = screenContentList.shuffled()
        contentLabel.text = screenContentList.first!

        // Do any additional setup after loading the view.
    }
    
    
    

    @IBAction func nextContent(_ sender: Any) {
        
        if i < screenContentList.count - 1 {
            i += 1
            contentLabel.text = screenContentList[i]
           
            
            
        }
        
        else {
            screenContentList = screenContentList.shuffled()
            i = 0
            contentLabel.text = screenContentList[i]
        }
        
        
        
    }
    
    @IBAction func previousContent(_ sender: Any) {
        
        if i > 0 {
            i -= 1
            contentLabel.text = screenContentList[i]
           
        }
        
        else {
            i = screenContentList.count - 1
            contentLabel.text = screenContentList[i]
        }
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func reverseButton(_ sender: Any) {
        if backgroundImage.backgroundColor == .white {
            backgroundImage.backgroundColor = .black
            contentLabel.textColor = .white
        } else {
            backgroundImage.backgroundColor = .white
            contentLabel.textColor = .black
        }
        
    }
   

}
