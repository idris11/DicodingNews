//
//  Service.swift
//  DicodingNews
//
//  Created by Idris on 18/04/20.
//  Copyright © 2020 Idris-labs. All rights reserved.
//

import Foundation
struct Service {
	static func getArticles(completion: @escaping ([NewsModel]?) -> ()) {
		let url = URL(string: "https://newsapi.org/v2/top-headlines?country=id&apiKey=29c99d03194f4d46acbbceaa5cd22f9d&pageSize=10&page=1")!
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				print(error.localizedDescription)
				completion(nil)
			} else if let data = data {
				let articleList = try? JSONDecoder().decode(ListNewsModel.self, from: data)
				if let articleList = articleList {
					completion(articleList.articles)
				}
			}
		}.resume()
	}
}
