//
//  AddViewController.swift
//  wordcase 0.2
//
//  Created by 新谷修平 on 2019/10/25.
//  Copyright © 2019 Shuhei Shintani. All rights reserved.
//

import UIKit

var contentList = [String]()

protocol CatchProtocol {
    
    func catchData(contentList: Array<String>)
    
}


class AddViewController: UIViewController, UITextFieldDelegate {
    
    var content = String()
    
  
    
    var delegate:CatchProtocol?
    
  
    

    @IBOutlet weak var contentTextField: UITextField!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func WordAddButton(_ sender: Any) {
        
        
        content = contentTextField.text!
        
        contentList.append(content)
        
        contentTextField.text = ""
        
        UserDefaults.standard.set(contentList, forKey: "addContentList" )
        
      
        
        
        
        
    }
    
    
    @IBAction func BackButton(_ sender: Any) {
        
        delegate?.catchData(contentList: contentList)
        
        dismiss(animated: true, completion: nil)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        contentTextField.resignFirstResponder()
        
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
