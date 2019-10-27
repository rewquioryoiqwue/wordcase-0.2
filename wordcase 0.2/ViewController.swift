//
//  ViewController.swift
//  wordcase 0.2
//
//  Created by 新谷修平 on 2019/10/25.
//  Copyright © 2019 Shuhei Shintani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CatchProtocol {
    
    
    
    
    var displayedContentList = [String]()
    
    var selectedText: String?
    
    var cellNumber: Int?
   
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if UserDefaults.standard.object(forKey: "Cell") != nil {
            
            
    
        contentList = UserDefaults.standard.object(forKey: "ContentList") as! [String]
        super.viewDidLoad()
            
        
        }
    
    
            
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func AddTransButton(_ sender: Any) {
        
        performSegue(withIdentifier: "transAdd", sender: nil)
        
    }
    
    
    
    @IBAction func ScreenTransButton(_ sender: Any) {
        
        performSegue(withIdentifier: "transScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "transAdd" {
            
        
            let addVC = segue.destination as! AddViewController
            addVC.delegate = self
            
        }
        
        if segue.identifier == "transScreen" {
            
            let screenVC = segue.destination as! ScreenViewController
            screenVC.screenContentList = displayedContentList
        }
        
        if (segue.identifier == "transEdit") {
            let editVC: EditViewController = (segue.destination as? EditViewController)!
           
           
            editVC.text = selectedText!
            editVC.number = cellNumber!
            editVC.delegate = self
        }
        
        
        
       
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
           return displayedContentList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           //変数を作る
           let ContentCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
           //変数の中身を作る
           ContentCell.textLabel!.text = displayedContentList[indexPath.row]
           //戻り値の設定（表示する中身)
           return ContentCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedText = displayedContentList[indexPath.row]
        cellNumber = indexPath.row
        
        
        performSegue(withIdentifier: "transEdit", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
        displayedContentList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            
        }
            
    }
    
    
    func catchData(contentList: Array<String>) {
        displayedContentList = contentList
        tableView.reloadData()
    }
    
    
    


}

