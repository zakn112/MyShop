//
//  GoodInfoViewController.swift
//  MyShop
//
//  Created by Андрей Закусов on 15.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit

class GoodInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var requestFactory: RequestFactory!
    var currentGood: Good?
    var reviews: [UserReview]?
    
    @IBOutlet weak var goodNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentGood = currentGood{
            goodNameLabel.text = currentGood.name
            priceLabel.text = String(currentGood.price)
            
            requestFactory = RequestFactory()
            
            let goodFactory = requestFactory.makeGoodDataRequestFactory()
            goodFactory.getGoodById(id: currentGood.id) { response in
                switch response.result {
                case .success(let result):
                    self.currentGood = result
                    DispatchQueue.main.async {
                        self.goodNameLabel.text = result.name
                        self.priceLabel.text = String(result.price)
                        self.descriptionLable.text = result.productDescription
                    }
                case .failure(_):
                    return
                }
                
            }
            
            let reviewFactory = requestFactory.makeReviewDataRequestFactory()
            reviewFactory.getGoodReviewsById(goodID: currentGood.id) { response in
                switch response.result {
                case .success(let result):
                    self.reviews = result
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(_):
                    return
                }
                
            }
            
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goodReviewCell", for: indexPath) as? GoodInfoReviewTableViewCell,
            let reviews = reviews {
            cell.userNameLabel.text = reviews[indexPath.row].userName
            cell.commentLabel.text = reviews[indexPath.row].massege
            return cell
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews?.count ?? 0 // your number of cells here
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
