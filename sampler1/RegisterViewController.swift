//
//  RegisterViewController.swift
//  sampler1
//
//  Created by 森川彩音 on 2018/09/16.
//  Copyright © 2018年 森川彩音. All rights reserved.
//

import UIKit
//import RealmSwift

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    var title1:String!
    var contents:String!
    var month:Int!
    var day:Int!
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func decide(_ sender: Any) {
        //全て記入されているかの確認
        guard titleTextField.text != nil else {
            alert(message: "タイトル入れて")
            return
        }
        guard contentsTextView.text != nil else {
            alert(message: "コンテンツ入れて")
            return
        }
        guard monthTextField.text != nil else {
            alert(message: "month入れて")
            return
        }
        guard dayTextField.text != nil else {
            alert(message: "day入れて")
            return
        }
        
        title1 = titleTextField.text
        contents = contentsTextView.text
        month = Int(dayTextField.text!)
        day = Int(monthTextField.text!)
        
        let data = AlertData()
        data.title = title1
        data.contents = contents
        data.month = month
        data.day = day
        //realm登録
        try! realm.write() {
            realm.add(data)
            alert(message: "登録完了")
            let storyboardagain: UIStoryboard = self.storyboard!
            let third = storyboard?.instantiateViewController(withIdentifier: "third")
            self.present(third!, animated: true, completion: nil)
        }
    }
    //alertのfunction
    func alert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}



