//
//  EntryTableTableViewController.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/06/12.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit

import UIKit
import RxSwift
import RxCocoa
import RxAlamofire

class EntryTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private let bag = DisposeBag()
    private var tableData = BehaviorSubject<[Entry]>(value: [])
    
    
    
    var viewModel:EntryViewModel!;
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "EntryTableViewCell", bundle: nil), forCellReuseIdentifier: "EntryTableViewCell")
        
        self.viewModel = EntryViewModel().injectEntryStore(EntryStoreImpl())
        
        viewModel.viewStateStream.subscribeNext { (state) in
            let newViewState = state.0 as! EntryViewState
            let oldViewState = state.1 as? EntryViewState
            
            
            if oldViewState == nil || oldViewState!.entryData != newViewState.entryData { //update data table
                self.tableData.onNext(newViewState.entryData)
            }
            }
            .addDisposableTo(self.bag)
        viewModel.setViewState(EntryViewState(isLoading: false, entryData: [Entry]()))
        
        tableData.bindTo(self.tableView.rx_itemsWithCellIdentifier("EntryTableViewCell")) {
            (index, entry: Entry, cell:EntryTableViewCell) in
            cell.updateCell(entry)
            }
            .addDisposableTo(self.bag)
        
        self.viewModel.execute(EntryViewModel.Command.FetchData, data: self.title)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.alpha = 0
        UIView.animateWithDuration(NSTimeInterval(0.8), animations: {
            cell.contentView.alpha = 1
        })
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
