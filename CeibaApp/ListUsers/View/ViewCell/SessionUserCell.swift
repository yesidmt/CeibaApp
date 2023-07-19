//
//  SessionUserCell.swift
//  CeibaApp
//
//  Created by yesid mendoza on 18/07/23.
//

import Foundation
import UIKit

class SessionUserCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var contentCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    func setView(){
        self.contentCard.layer.borderWidth = 0.1
        self.contentCard.layer.borderColor = UIColor.gray.cgColor
        self.contentCard.layer.shadowColor = UIColor.gray.cgColor
        self.contentCard.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.contentCard.layer.shadowRadius = 4.0
        self.contentCard.layer.shadowOpacity = 0.3
        
    }
    func setData(item: Item) {
        name.text = item.name
        phone.text = item.phone
        email.text = item.email
    }
    
}

