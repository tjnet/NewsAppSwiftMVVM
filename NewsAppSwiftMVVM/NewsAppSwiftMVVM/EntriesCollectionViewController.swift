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


class EntriesCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout   {
    
    var presenter: EntriesPresenter!
    
    let paddingBetweenCells: Int = 0
    let numberOfCells: Int = 2
    
    private let bag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var entries = Variable([Entry]())

    override func viewDidLoad() {
        super.viewDidLoad()
        steupCollectionView()
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


    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    // is this redundant logic?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch(indexPath.row){
        case 0:
            return CGSize(width: self.view.frame.size.width, height: 200)
        default:
            return CGSize(width: self.view.frame.size.width * 0.5, height: 200)
        }
    }
    
    private func steupCollectionView() {
        
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
