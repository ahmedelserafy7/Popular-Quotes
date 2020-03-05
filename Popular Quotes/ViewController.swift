//
//  ViewController.swift
//  Popular Quotes
//
//  Created by Elser_10 on 12/11/18.
//  Copyright © 2018 Elser_10. All rights reserved.
//

import UIKit

class PopularQuotesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    fileprivate let pageCellId = "pageCellId"
    
    let agendaView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        //        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    let pageCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1 of 2"
        //        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var popArr = [Popular]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(pageCountLabel)
        
        pageCountLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageCountLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pageCountLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pageCountLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        collectionView.register(QuoteViewCell.self, forCellWithReuseIdentifier: pageCellId)
        
        let firstPop = Popular("The people who are crazy enough to think, they can change the world are the ones who do.", "steve")
        popArr.append(firstPop)
        
        let secondPop = Popular("Try not to become a man of success, but rather try to become a man of value.", "einstein")
        popArr.append(secondPop)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pagesCount = targetContentOffset.pointee.x / view.frame.width
        pageCountLabel.text = "\(Int(pagesCount) + 1) of 2"
        //print(pagesCount)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    var pageColors: [UIColor] = [.blue, .green]
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCellId, for: indexPath) as! QuoteViewCell
        cell.backgroundColor = pageColors[indexPath.item]
        
        guard let text = popArr[indexPath.item].quote else { return UICollectionViewCell() }
        cell.quoteLabel.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        
        guard let popImage = popArr[indexPath.item].popularImage else { return UICollectionViewCell() }
        cell.popularImageView.image = UIImage(named: popImage)
        
        cell.quoteBackgroundViewWidthAnchor?.constant = estimatedSizeOfText(text).width + 20
        cell.quoteBackgroundViewHeightAnchor?.constant = estimatedSizeOfText(text).height + 30
        return cell
    }
    
    func estimatedSizeOfText(_ text: String)-> CGRect {
        let size = CGSize(width: 250, height: 1000)
        return NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}










