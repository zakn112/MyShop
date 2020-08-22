//
//  BasketInfoViewController.swift
//  MyShop
//
//  Created by Андрей Закусов on 22.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit

class BasketInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var goodsTable: UITableView!
    
    
    var goods: [Good]?
    var quantity: Int = 0
    var amount: Int = 0
    var requestFactory: RequestFactory!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestFactory = RequestFactory()
        let basketRequestFactory = requestFactory.makeBasketDataRequestFactory()
        basketRequestFactory.getBasket() { response in
            switch response.result {
            case .success(let result):
                self.goods = result.contents
                self.quantity = result.countGoods
                self.amount = result.amount
                DispatchQueue.main.async {
                    self.quantityLabel.text = String(self.quantity)
                    self.amountLabel.text = String(self.amount)
                    self.goodsTable.reloadData()
                }
            case .failure(_):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "The data of basket is not available", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goodCell", for: indexPath) as? GoodTableViewCell,
            let goods = goods {
            cell.good = goods[indexPath.row]
            cell.isAddBasket = false
            cell.goodNametlabelView.text = goods[indexPath.row].name
            cell.goodCostlabelView.text = String(goods[indexPath.row].price)
            return cell
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods?.count ?? 0 // your number of cells here
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
