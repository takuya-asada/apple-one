//
//  ViewController.swift
//  apple-one
//
//  Created by 浅田拓哉 on 2017/07/25.
//  Copyright © 2017年 浅田拓哉. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    func getArticle(){
        Alamofire.request("https://qiita.com/api/v2/items",method:.get, parameters:nil)
            .responseJSON { response in
                print(response.result.value as Any) // responseのresultプロパティのvalueプロパティをコンソールに出力
        }
    }
    
    @IBAction func button(_ sender: Any) {
    
        getArticle()
        
        do{
            let toJSON: JSON =  ["name": "Jack", "age": 25]
            textView.text = "\(toJSON)"
            
            
            let jsonString = "{\"あああ\": 25}"
            let dataFromString = jsonString.data(using: String.Encoding.utf8)
            var json = try JSON(data: dataFromString!)
            print(json["あああ"])
        }catch{
            print(error)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

