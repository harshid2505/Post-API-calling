//
//  ViewController.swift
//  Post API calling
//
//  Created by HARSHID PATEL on 23/03/23.
//

import UIKit
import Alamofire

struct postApi : Codable{
//    var name: String
//    var job: String
    var id: String
    var createdAt: String
}

class ViewController: UIViewController {
    
//    var arr: [postApi] = []

    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func postData(name: String,job: String){
        let parameter: [String: Any] = ["name" : name,"job" : job]
        let header: HTTPHeaders = ["content-Type" : "application/from-data"]
        AF.request("https://reqres.in/api/users",method: .post,parameters: parameter,headers: header).responseData { response in
            switch response.result{
            case.success(let data):
                do{
                    let arr = try JSONDecoder().decode(postApi.self, from: data)
                    print(arr)
                }
                catch{
                    print(error.localizedDescription)
                }
            case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    @IBAction func button1Action(_ sender: UIButton) {
        postData(name: t1.text ?? "", job: t2.text ?? "")
    }
    
}

