//
//  NewsTableViewCell.swift
//  DicodingNews
//
//  Created by Idris on 18/04/20.
//  Copyright © 2020 Idris-labs. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
	
	@IBOutlet weak var titleNews: UILabel!
	@IBOutlet weak var authorNews: UILabel!
	@IBOutlet weak var imageNews: UIImageView!
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
}
