//
//  NewsDetailViewController.swift
//  DicodingNews
//
//  Created by Idris on 19/04/20.
//  Copyright © 2020 Idris-labs. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
	var newsDetail: NewsModel?
	
	@IBOutlet weak var newsImage: UIImageView!
	@IBOutlet weak var newsTitle: UILabel!
	@IBOutlet weak var newsAuthor: UILabel!
	@IBOutlet weak var newsContent: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let newsDetail = self.newsDetail {
			newsTitle.text = newsDetail.title
			self.title = "News Detail"
			if let urlImage = newsDetail.urlToImage {
				guard let urlImage = URL(string: urlImage) else {fatalError()}
				guard let imgData = try? Data(contentsOf: urlImage) else {fatalError()}
				newsImage.image = UIImage(data: imgData)
			}
			else {
				newsImage.image = UIImage(systemName: "circle.fill")
			}
			
			if let author = newsDetail.author {
				newsAuthor.text = author
			}
			else {
				newsAuthor.text = "Unknown Author"
			}

			if let description = newsDetail.description {
				newsContent.text = description
			}
			else {
				newsContent.text = "No Content"
			}
		}
	}
}
