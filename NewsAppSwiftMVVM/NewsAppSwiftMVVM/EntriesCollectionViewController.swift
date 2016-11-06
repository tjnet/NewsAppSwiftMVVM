//
//  EntriesCollectionViewController.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/10/24.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import RxSwift

class EntriesCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let paddingBetweenCells: Int = 0
    let numberOfCells: Int = 2
    
    private let bag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let items = Observable.just([
//            Entry(),
//            Entry(),
//            Entry()
//            ])
//        items
//            .bindTo(collectionView.rx.items) { (collectionView, row, element) in
//                let indexPath = IndexPath(row: row, section: 0)
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EntriesCollectionViewCell", for: indexPath) as! EntriesCollectionViewCell
//                cell.caption?.text = "\(element) @ \(row)"
//                return cell
//            }
//            .addDisposableTo(bag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EntriesCollectionViewCell", for: indexPath as IndexPath) as! EntriesCollectionViewCell
        
        cell.caption.text = "hoge"
        return cell
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch(indexPath.row){
        case 0:
            return CGSize(width: self.view.frame.size.width, height: 200)
        default:
            return CGSize(width: self.view.frame.size.width * 0.5 - 4.0, height: 200)
        }
        
        
    }

}
