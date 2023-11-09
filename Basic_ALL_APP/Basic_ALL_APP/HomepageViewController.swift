//
//  HomepageViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 19/09/23.
//

import UIKit

class HomepageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var imgg = ["2", "2", "2", "2", "2"]
    
    
    
    @IBOutlet weak var tblview: UITableView!
    
    var jsonresponse : [root] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        getMethod()
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jsonresponse.count
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vc1 = tableView.dequeueReusableCell(withIdentifier: "homecell", for: indexPath) as! NewTableViewCell
        
        vc1.lbl1.text = jsonresponse[indexPath.row].login
        vc1.lbl2.text = jsonresponse[indexPath.row].node_id
        vc1.lbl3.text = String(jsonresponse[indexPath.row].id)
        
       // vc1.immgs.image = UIImage(named: imgg[indexPath.row])
        
        return vc1
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
    }
    
    
    func getMethod() {
        
        let urlstring = "https://api.github.com/users/hadley/orgs"             // ---->  String value
        
        //----> To check the URL value. URL value vai check pannitu athu correctah iruntha next step poguthu otherwise intha step la yae error throw pannuthu
        
        guard let url = URL(string: urlstring)          // ----> It converts String value to URL.
        
        else {
            
            print("Error: cannot create URL")
            
            return
        }
        // Create the url request
        
        var request = URLRequest(url: url)                  // ---->  namaloda URL ku oru variable request create panrom
        
        request.httpMethod = "GET"                         // ----> create panna request ku GET nu Method assign panrom
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in  //  ----> ithula vara data,res and err ellam postman la vara koodiyathu, Itha process pannitha nama next  step process ku porom.
            
            guard error == nil
            
            else {  // ---> err val fail ana ithula ulla print run agum and totally veliya poidum
                
                print("Error: error calling GET")
                
                print(error!)
                
                return
            }
            
            
            //---> err val pass ana apro data section process agum, fail ana ithula ulla print run agum, pass ana next  step process ku porom.
            
            guard let data = data
            
            else {
                
                print("Error: Did not receive data")
                
                return
                
            }
            
            //---> intha step la 2 validation panron 1. response and 2. status code. so 2 val pass ana apro do catch section process agum, fail ana ithula ulla print run agum.
            
            guard let response = response as? HTTPURLResponse,(200 ..< 299) ~= response.statusCode
            
            else {
                
                print("Error: HTTP request failed")
                
                return
                
            }
            
            
            //---> mela kidacha response data va nama decode panni paka porom.
            
            do {
                
                let responseData = try JSONDecoder().decode([root].self, from: data)
                
                print(responseData)
                
                self.jsonresponse = responseData   //doubtt....
                
                print(responseData)
                
                DispatchQueue.main.async {     // Ithu main thread ku code run panna kodulura comment
                    
                    self.tblview.reloadData()
                    
                }
                //                            for a in responseData{
                //                                print(a.id)
                //                                print(a.login)
                //                            }
            }
            
            catch {
                
             //   print(error)
                
                print("Error: Trying to convert JSON data to string")
                
                return
                
            }
            
        }.resume()
        
    }
    
    
    
    
    
    
    
    struct root: Codable {   //---> struct manuallu created datatype
        let login: String
        let id: Int
        let node_id: String
        
        
    }
    
}

    
    
    
    


