//
//  LoadingView.swift
// 	LoadingView
//
//  Created by Gonzalo Gonzalez  on 20/01/2020.
//  Copyright © 2020 Solid GEAR Projects SL. All rights reserved.
//


import UIKit

public extension UIView {
	func showLoader() {
		let loader = LoadingView(frame: frame)
		self.addSubview(loader)
	}
	
	func removeLoader() {
		if let loader = subviews.first(where: { $0 is LoadingView }) {
			loader.removeFromSuperview()
		}
	}
}

open class LoadingView: UIView {
	
	var blurEffectView: UIVisualEffectView?
	
	override init(frame: CGRect) {
		let blurEffect = UIBlurEffect(style: .dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = frame
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.blurEffectView = blurEffectView
		super.init(frame: frame)
		addSubview(blurEffectView)
		addLoader()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	fileprivate func addLoader() {
		guard let blurEffectView = blurEffectView else { return }
		let dimmensions: Int = 50
		let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
		activityIndicator.frame = CGRect(x: 0, y: 0, width: dimmensions, height: dimmensions)
		blurEffectView.contentView.addSubview(activityIndicator)
		activityIndicator.center = blurEffectView.contentView.center
		activityIndicator.startAnimating()
	}
}

