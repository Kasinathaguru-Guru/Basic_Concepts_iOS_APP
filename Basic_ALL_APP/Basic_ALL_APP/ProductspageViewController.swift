//
//  ProductspageViewController.swift
//  Basic_ALL_APP
//
//  Created by Guru on 19/09/23.
//

import UIKit

class ProductspageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var jsonresponse: [root] = []
    
    var imgcolll = ["2", "2", "2", "2", "2"]
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
               return jsonresponse.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pc = collectionview.dequeueReusableCell(withReuseIdentifier: "Procell", for: indexPath) as! NewCollectionViewCell
        
                pc.lblcol.text = jsonresponse[indexPath.row].login
                pc.lblcol1.text = jsonresponse[indexPath.row].node_id
        
             //  pc.imgcol.image = UIImage(named: imgcolll[indexPath.row])
        
                return pc
        
    }
    
    
    
    
    
//    func collectionview(_ collectionview: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//            return 200
//        }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       pushmethod()
        
        
    }
    
    
    
    func pushmethod() {
        
        let url = "https://api.github.com/users/hadley/orgs"
        
        guard let url = URL(string: url)
                
        else {
            
            print("Error: cannot create URL")
            
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            
            
            guard error == nil
                    
            else {  // ---> err val fail ana ithula ulla print run agum and totally veliya poidum
                
                print("Error: error calling GET")
                
                print(error!)
                
                return
            }
            
            
            guard let data = data
            
            else {
                
                print("Error: Did not receive data")
                
                return
                
            }
            
            
            guard let response = response as? HTTPURLResponse,(200 ..< 299) ~= response.statusCode
            
            else {
                
                print("Error: HTTP request failed")
                
                return
                
            }
            
            
            do {
                
                let responseData = try JSONDecoder().decode([root].self, from: data)
                
                print(responseData)
                
                self.jsonresponse = responseData   //doubtt....
                
                print(responseData)
                
                DispatchQueue.main.async {     // Ithu main thread ku code run panna kodulura comment
                    
                    self.collectionview.reloadData()
                    
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
    
        
    struct root: Codable {   //---> struct manually created datatype
        let login: String
        let id: Int
        let node_id: String
        
        
    }
    
    }
