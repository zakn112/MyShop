//
//  GoodsListTableViewController.swift
//  MyShop
//
//  Created by Андрей Закусов on 11.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class GoodsListTableViewController: UITableViewController {
    private var requestFactory: RequestFactory!
    var goods: [Good]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        requestFactory = RequestFactory()
        let catalog = requestFactory.makeCatalogDataRequestFactory()
        catalog.catalogData() { response in
            switch response.result {
            case .success(let result):
                self.goods = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "The list of goods is not available", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        Analytics.logEvent("Open_goods_list", parameters: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return goods?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goodCell", for: indexPath) as? GoodTableViewCell,
            let goods = goods {
            cell.good = goods[indexPath.row]
            cell.isAddBasket = true
            cell.goodNametlabelView.text = goods[indexPath.row].name
            cell.goodCostlabelView.text = String(goods[indexPath.row].price)
            return cell
        }
        else{
            return UITableViewCell()
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let goodInfoController = segue.destination as? GoodInfoViewController,
            let index = tableView.indexPathForSelectedRow,
            let goods = goods
        {
            goodInfoController.currentGood = goods[index.row]
        }
    }
    

}
