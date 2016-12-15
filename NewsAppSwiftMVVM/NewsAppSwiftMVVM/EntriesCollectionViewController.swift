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
//    private var flowLayout: UICollectionViewFlowLayout! = UICollectionViewFlowLayout()
    
     let entriesCollectionViewLayout = EntriesCollectionViewLayout()
    
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
        
        collectionView.collectionViewLayout = entriesCollectionViewLayout
        
        entriesCollectionViewLayout.delegate = self
        
        entries.asObservable().bindTo(self.collectionView.rx.items(cellIdentifier: "EntriesCollectionViewCell", cellType: EntriesCollectionViewCell.self)) { (row, element, cell) in
            
            cell.configure(entry: element)
            
            
        }.addDisposableTo(bag)
    }
    

}

extension EntriesCollectionViewController: ListEntriesUI {
    var viewController: UIViewController { return self }
    
    func showEntries(entries: [Entry]) {
        self.entries.value = entries
    }
}


// MARK: - PhotoCollectionViewLayoutDelegate
extension EntriesCollectionViewController: EntriesCollectionViewLayoutDelegate {
    func heightForPhotoAtIndexPath(_ collectionView :UICollectionView,indexPath :IndexPath,width :CGFloat) -> CGFloat {
        
        let items =  entries.value
        let entry = items[indexPath.item]
        
        if let url = NSURL(string: entry.thumbnail) {
            if let data = NSData(contentsOf: url as URL){
                if let image = UIImage(data : data as Data) {
                    return EntriesCollectionViewCell.imageHeightWithImage(image, cellWidth: width)
                }
            }
        }
        
        return 0.0
        
    }
    
    func heightForTitleAtIndexPath(_ collectionView: UICollectionView,indexPath: IndexPath,width: CGFloat) -> CGFloat {
        let entry = entries.value[indexPath.item]
        
        return EntriesCollectionViewCell.titleHeightWithText(entry.title, cellWidth: width)

    }
    
}
