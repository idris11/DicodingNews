//
//  Extensions.swift
//  DicodingNews
//
//  Created by Idris on 18/04/20.
//  Copyright © 2020 Idris-labs. All rights reserved.
//

import UIKit
extension UIImageView {
	func makeRounded() {
		self.layer.masksToBounds = false
		self.layer.borderColor = UIColor.black.cgColor
		self.layer.cornerRadius = 10
		self.clipsToBounds = true
	}
}

extension UIViewController {
	func showSpinner(onView : UIView) {
		let spinnerView = UIView.init(frame: onView.bounds)
		spinnerView.backgroundColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.1)
		
		let loadingView: UIView = UIView()
		loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		loadingView.center = onView.center
		loadingView.backgroundColor = UIColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.6)
		loadingView.clipsToBounds = true
		loadingView.layer.cornerRadius = 10
		
		
		let ai : UIActivityIndicatorView = UIActivityIndicatorView()
		ai.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
		ai.style = UIActivityIndicatorView.Style.large
		ai.center = CGPoint(x: loadingView.frame.size.width/2, y: loadingView.frame.size.height/2)
		
		
		DispatchQueue.main.async {
			loadingView.tag = 99
			spinnerView.tag = 100
			loadingView.addSubview(ai)
			spinnerView.addSubview(loadingView)
			onView.addSubview(spinnerView)
			onView.bringSubviewToFront(spinnerView)
			onView.bringSubviewToFront(ai)
		}
		ai.startAnimating()
	}
	
	func removeSpinner() {
		DispatchQueue.main.async {
			self.view.viewWithTag(99)?.removeFromSuperview()
			self.view.viewWithTag(100)?.removeFromSuperview()
		}
	}
}
