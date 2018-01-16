//
//  HomeViewController.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    fileprivate let homeCell = "HomeTableViewCell"
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAllRooms { (rooms) in
            print("rooms:\(String(describing: rooms))",rooms)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = DefaultTheme.viewBackgroundColor
      
        homeTableView.register(UINib(nibName: homeCell, bundle: Bundle.main), forCellReuseIdentifier: homeCell)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Data
    func fetchAllRooms(completion: @escaping ([PicItemModel]?) -> Void) {
//        let url = URL(string: "http://localhost:5984/rooms/_all_docs?include_docs=true")!
       
        Alamofire.request(
            URL(string: "http://localhost:5984/rooms/_all_docs")!,
            method: .get,
            parameters: ["include_docs": "true"])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(response.result.error)")
                    completion(nil)
                    return
                }
                
//                guard let value = response.result.value as? [String: Any],
//                    let rows = value["rows"] as? [[String: Any]] else {
//                        print("Malformed data received from fetchAllRooms service")
//                        completion(nil)
//                        return
//                }
                
//                var json: NSDictionary? = nil
                var rooms:[PicItemModel]? = nil
                do {
                    let decoder = JSONDecoder()
                    rooms = try decoder.decode([PicItemModel].self, from: response.data!)
                } catch {
                    print("error======")
                }
            
                
//                let rooms = rows.flatMap({ (roomDict) -> PicItemModel? in
//                    return PicItemModel(from: roomDict as! Decoder)
//                })
                
                completion(rooms)
        }
        
    }
    

}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let model = self.photoModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCell, for: indexPath) as! HomeTableViewCell
        
        return cell
    }
    

}

