//
//  EntriesCollectionViewController.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/10/24.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import RxSwift
import Foundation
import RxCocoa


class EntriesCollectionViewController: UIViewController {
    
    var presenter: EntriesPresenter!
    
    let paddingBetweenCells: Int = 0
    let numberOfCells: Int = 2
    
    private let bag = DisposeBag()
    private var flowLayout: UICollectionViewFlowLayout! = UICollectionViewFlowLayout()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var entries = Variable([Entry]())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private func setupCollectionView() {

        self.collectionView.delegate = self
        
        entries.asObservable().bindTo(self.collectionView.rx.items(cellIdentifier: "EntriesCollectionViewCell", cellType: EntriesCollectionViewCell.self)) { (row, element, cell) in
            
            cell.caption.text = element.title
            
        }.addDisposableTo(bag)
    }
    

}

extension EntriesCollectionViewController: ListEntriesUI {
    var viewController: UIViewController { return self }
    
    func showEntries(entries: [Entry]) {
        self.entries.value = entries
    }
}

extension EntriesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 20.0
        
        // see https://possiblemobile.com/2016/05/uicollectionview-dynamic-cell-widths/
        let height: CGFloat = 200
        var width: CGFloat
        
        switch(indexPath.row){
//        case 0:
//            width = floor(collectionView.frame.size.width - margin)
        default:
            width = floor((collectionView.frame.size.width - margin) / 2.0)
        }
        
        return CGSize(width: width, height: 200)
    }

}
