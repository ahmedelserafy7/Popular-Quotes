//
//  QuoteViewCell.swift
//  Popular Quotes
//
//  Created by Elser_10 on 12/11/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import UIKit
import CLTypingLabel

class QuoteViewCell: UICollectionViewCell {
    
    let popularImageView: UIImageView = {
        let iv = UIImageView()
//        iv.backgroundColor = .red
        iv.layer.cornerRadius = 100 / 2
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let quoteLabel: CLTypingLabel = {
        let label = CLTypingLabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
//        label.charInterval = 0.2
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .yellow
        return label
    }()
    
    let quoteBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
//        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bubbleView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "bubble").withRenderingMode(.alwaysTemplate).resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)))
        iv.tintColor = UIColor(white: 0.95, alpha: 1)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var quoteBackgroundViewWidthAnchor: NSLayoutConstraint?
    var quoteBackgroundViewHeightAnchor: NSLayoutConstraint?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(quoteBackgroundView)
        quoteBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        quoteBackgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        quoteBackgroundViewWidthAnchor = quoteBackgroundView.widthAnchor.constraint(equalToConstant: 250)
        quoteBackgroundViewWidthAnchor?.isActive =  true
        quoteBackgroundViewHeightAnchor = quoteBackgroundView.heightAnchor.constraint(equalToConstant: 100)
        quoteBackgroundViewHeightAnchor?.isActive = true
        
        quoteBackgroundView.addSubview(bubbleView)
        bubbleView.topAnchor.constraint(equalTo: quoteBackgroundView.topAnchor).isActive = true
        bubbleView.leftAnchor.constraint(equalTo: quoteBackgroundView.leftAnchor).isActive = true
        bubbleView.rightAnchor.constraint(equalTo: quoteBackgroundView.rightAnchor).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: quoteBackgroundView.bottomAnchor).isActive = true
        
        addSubview(quoteLabel)
        quoteLabel.topAnchor.constraint(equalTo: quoteBackgroundView.topAnchor).isActive = true
        quoteLabel.leftAnchor.constraint(equalTo: quoteBackgroundView.leftAnchor, constant: 14).isActive = true
        quoteLabel.rightAnchor.constraint(equalTo: quoteBackgroundView.rightAnchor, constant: -10).isActive = true
        quoteLabel.bottomAnchor.constraint(equalTo: quoteBackgroundView.bottomAnchor).isActive = true
        
        addSubview(popularImageView)
        popularImageView.topAnchor.constraint(equalTo: quoteBackgroundView.bottomAnchor).isActive = true
        popularImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        popularImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        popularImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
