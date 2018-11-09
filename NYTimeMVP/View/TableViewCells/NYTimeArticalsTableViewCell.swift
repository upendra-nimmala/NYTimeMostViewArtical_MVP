//
//  NYTimeArticalsTableViewCell.swift
//  NYTimeMVP
//
//  Created by Upendra Nimmala on 09/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import UIKit
import SDWebImage

class NYTimeArticalsTableViewCell: UITableViewCell {
    @IBOutlet weak var articalTumb_Img: UIImageView!
    @IBOutlet weak var articalSource_lbl: UILabel!
    @IBOutlet weak var articalTitle_lbl: UILabel!
    @IBOutlet weak var articalDate_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(item: Article) {
        articalTitle_lbl.text = item.title
        articalSource_lbl.text = item.source
        articalDate_lbl.text = item.published_date
        
        let media = (item.media.first)!
        for mataData in media.mediaMetaData {
            if mataData.format == "Standard Thumbnail" {
                print(mataData.url as Any)
                articalTumb_Img.sd_setImage(with: URL(string: mataData.url!), placeholderImage: UIImage(named: "placeholder.png"))
            }
        }

    }
}
