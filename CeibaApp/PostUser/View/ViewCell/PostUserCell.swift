//
//  PostUserCell.swift
//  CeibaApp
//
//  Created by yesid mendoza on 19/07/23.
//

import Foundation
import UIKit

class PostUserCell: UITableViewCell {
    // MARK: - @IBOutlet
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var body: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    func setView(){
        self.contentView.layer.borderWidth = 0.2
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.contentView.layer.shadowRadius = 4.0
        self.contentView.layer.shadowOpacity = 0.3
        
    }
    func setData(postUserItem: PostUserItem) {
        tittle.text = postUserItem.title
        body.text = postUserItem.body
    }
    
}

