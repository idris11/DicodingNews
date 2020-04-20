//
//  ViewController.swift
//  DicodingNews
//
//  Created by Idris on 18/04/20.
//  Copyright © 2020 Idris-labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var news: [NewsModel] = []
	var selectedNews: NewsModel?

	@IBOutlet weak var newsTableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		self.newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
		self.newsTableView.delegate = self
		self.newsTableView.dataSource = self
		self.showSpinner(onView: self.view)
		Service.getArticles {[weak self] (results) in
			if let results = results {
				self?.news = results
				DispatchQueue.main.async {
					self?.newsTableView.reloadData()
					self?.removeSpinner()
				}
			}
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "GoToDetail" {
			let destinationVC = segue.destination as! NewsDetailViewController
			destinationVC.newsDetail = self.selectedNews
		}
	}
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return news.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = self.newsTableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
		cell.authorNews.text = news[indexPath.row].author ?? "Unknown Author"
		cell.titleNews.text = news[indexPath.row].title
		
		if let urlImage = news[indexPath.row].urlToImage {
			guard let urlImage = URL(string: urlImage) else {fatalError()}
			guard let imgData = try? Data(contentsOf: urlImage) else {fatalError()}
			cell.imageNews.image = UIImage(data: imgData)
			cell.imageNews.makeRounded()
		}
		else {
			cell.imageNews.image = UIImage(systemName: "circle.fill")
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedNews = self.news[indexPath.row]
		self.performSegue(withIdentifier: "GoToDetail", sender: nil)
	}
}
