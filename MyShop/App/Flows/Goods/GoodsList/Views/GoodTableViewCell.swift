//
//  GoodTableViewCell.swift
//  MyShop
//
//  Created by Андрей Закусов on 22.08.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class GoodTableViewCell: UITableViewCell {
    private var requestFactory: RequestFactory!
    var good: Good?
    
    let goodImageView = UIImageView()
    let goodNametlabelView = UILabel()
    let goodCostlabelView = UILabel()
    let addRemoveBasketButton = UIButton()
    var isAddBasket = true {
        didSet{
           if isAddBasket {
               addRemoveBasketButton.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
           }else{
               addRemoveBasketButton.setImage(UIImage(systemName: "cart.badge.minus"), for: .normal)
           }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupView() {
        removeSubviews()
        
        goodImageView.image = #imageLiteral(resourceName: "notebook")
        
        goodCostlabelView.textAlignment = .right
        
        goodNametlabelView.textColor = .systemIndigo
        
        addRemoveBasketButton.titleLabel?.textColor = .white
        addRemoveBasketButton.tintColor = .white
        addRemoveBasketButton.backgroundColor = .systemIndigo
        addRemoveBasketButton.addTarget(self, action: #selector(addRemoveBasketButtonAction), for: .touchUpInside)
        
        addSubview(goodImageView)
        addSubview(goodNametlabelView)
        addSubview(goodCostlabelView)
        addSubview(addRemoveBasketButton)
    }
    
    func removeSubviews() {
        goodImageView.removeFromSuperview()
        goodNametlabelView.removeFromSuperview()
        goodCostlabelView.removeFromSuperview()
        addRemoveBasketButton.removeFromSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margin: CGFloat = 2
        var currentX: CGFloat = 0
        var currentWidth: CGFloat = 0
        
        currentX = 10
        currentWidth = self.bounds.height - margin * 2
        
        let imageViewRect = CGRect(x: currentX, y: 2, width: currentWidth, height: self.bounds.height - margin * 2)
        goodImageView.frame = imageViewRect
        
        currentX += currentWidth + 10
        currentWidth = self.bounds.width - 200 - self.bounds.height
        
        let labelViewRect = CGRect(x: currentX, y: 0, width: currentWidth, height: self.bounds.height)
        goodNametlabelView.frame = labelViewRect
        
        currentX += currentWidth + 10
        currentWidth = 120
        
        let goodCostViewRect = CGRect(x: currentX, y: 0, width: currentWidth, height: self.bounds.height)
        goodCostlabelView.frame = goodCostViewRect
        
        currentX += currentWidth + 10
        currentWidth = 40
        
        let addRemoveBasketButtonRect = CGRect(x: currentX, y: 6, width: currentWidth, height: self.bounds.height - 12)
        addRemoveBasketButton.frame = addRemoveBasketButtonRect
        
    }
    
    @objc func addRemoveBasketButtonAction(sender: UIButton!) {
        if isAddBasket {
            requestFactory = RequestFactory()
            let basket = requestFactory.makeBasketDataRequestFactory()
            basket.addToBasket(goodID: good!.id){ response in
                switch response.result {
                case .success(_):
                    Analytics.logEvent("Good_add_basket", parameters: nil)
                    break
                case .failure(_):
                    break
                }
            }
        }else{
            
            requestFactory = RequestFactory()
            let basket = requestFactory.makeBasketDataRequestFactory()
            basket.deleteFromBasket(goodID: good!.id){ response in
                switch response.result {
                case .success(_):
                    Analytics.logEvent("Good_delete_basket", parameters: nil)
                    break
                case .failure(_):
                    break
                }
            }
            
        }
        
    }
}
