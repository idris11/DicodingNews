//
//  NewsModel.swift
//  DicodingNews
//
//  Created by Idris on 18/04/20.
//  Copyright © 2020 Idris-labs. All rights reserved.
//

import Foundation
struct ListNewsModel: Decodable {
  let articles: [NewsModel]
}
struct NewsModel: Decodable {
  let title: String
  let description: String?
	let author: String?
	let urlToImage: String?
	let content: String?
}
