//
//  TableViewController.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/05/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxAlamofire
import SafariServices

class TableViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    private let bag = DisposeBag()
    var entryList: [Entry]  = []
    
    var entries = Variable([Entry]())
    
    // create ViewModel
    let viewModel = EntriesViewModel(service: EntryAPIService(entryStore: EntryStoreImpl()))
    
    init(nibName: String, title: String) {
        super.init(nibName: nibName, bundle: nil)
        self.title = title
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "EntryTableViewCell", bundle: nil), forCellReuseIdentifier: "EntryTableViewCell")
        
        viewModel.reloadData(title: self.title!)
        
        // see http://yannickloriot.com/2016/01/make-uitableview-reactive-with-rxswift/
        // bind articles to UITableView
        
        // If there is a `drive` method available instead of `bindTo`,
        // that means that the compiler has proven that all properties
        // are satisfied.
        entries.asObservable().bindTo(self.tableView.rx.items(cellIdentifier: "EntryTableViewCell")){ (index: Int, entry: Entry, cell:EntryTableViewCell) in
            cell.updateCell(entry: entry)
        }.addDisposableTo(bag)
        
//        viewModel.entries.drive(onNext: { [unowned self] in
//            self.entryList = $0
//        }).addDisposableTo(bag)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        struct Cell {
            static var cell = UINib(nibName: "EntryTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil).first as! EntryTableViewCell
        }
        
        Cell.cell.setNeedsLayout()
        Cell.cell.layoutIfNeeded() //crucial after changng autolayout constraint
        
        return 120
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let entry = self.entryList[indexPath.row]
        let storyboard = UIStoryboard(name: "EntryViewController", bundle: nil)
        let entryVC : EntryViewController = storyboard.instantiateViewController(withIdentifier: "EntryViewController") as! EntryViewController
        entryVC.url = NSURL(string: entry.link)!
        self.navigationController?.pushViewController(entryVC, animated: true)
        
        reloadRowsAtIndexPath(indexPath: indexPath)
    }
    
    
    func reloadRowsAtIndexPath(indexPath: NSIndexPath) {
        tableView.reloadRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.none)
    }

    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.alpha = 0
        UIView.animate(withDuration: TimeInterval(0.8), animations: {
            cell.contentView.alpha = 1
        })
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame.size.width = self.view.bounds.width
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
