//
//  EntryTableViewCell,.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/06/10.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage
import Alamofire

class EntryTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var viewModel:EntryTableViewCellViewModel!
    let bag = DisposeBag();
    let ogpApi = "http://api.hitonobetsu.com/ogp/analysis?url=";
    
    var link: String! {
        didSet {
            Alamofire.request(.GET, ogpApi + link).responseJSON { response in
                if let imageUrl = response.result.value?["image"] as? String {
                    self.setThumbnailImageView(NSURL(string: imageUrl))
                }
            }
        }
    }
    
    func setThumbnailImageView(imageUrl: NSURL!){
        self.thumbnailView.sd_setImageWithURL(imageUrl, placeholderImage: UIImage(named: "UnderComputer-48.png")){// see https://icons8.com/web-app/for/all/developper
            (image, error, cacheType, url)->Void in
            UIView.animateWithDuration(0.80){
                self.thumbnailView.alpha = 1
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(entry:Entry) {
        titleLabel.text = entry.title
        link = entry.link
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
        self.bounds = self.contentView.bounds
        self.titleLabel.preferredMaxLayoutWidth = self.titleLabel.frame.size.width
    }
}