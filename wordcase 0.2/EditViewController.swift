//
//  EditViewController.swift
//  wordcase 0.2
//
//  Created by 新谷修平 on 2019/10/26.
//  Copyright © 2019 Shuhei Shintani. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    var text = String()
    var number = Int()
    var editContent = String()
    
    var delegate:CatchProtocol?

    @IBOutlet weak var editContentLabel: UILabel!
    
    @IBOutlet weak var editTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editContentLabel.text = contentList[number]
        editTextField.text = text
        
        editTextField.delegate = self 

        // Do any additional setup after loading the view.
    }
    

    @IBAction func editButton(_ sender: Any) {
        editContent = editTextField.text!
        
        contentList[number] = editContent
        
      
        
        editContentLabel.text = contentList[number]

        editTextField.text = ""

        UserDefaults.standard.set(contentList, forKey: "ContentList" )
        
    }
    
    @IBAction func back(_ sender: Any) {
        delegate?.catchData(contentList: contentList)
        dismiss(animated: true, completion: nil)
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
