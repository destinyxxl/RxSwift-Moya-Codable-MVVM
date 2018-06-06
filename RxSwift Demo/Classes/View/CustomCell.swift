//
//  CustomCell.swift
//  RxSwift Demo
//
//  Created by 冯晓林 on 2018/6/2.
//  Copyright © 2018年 WeShion. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class CustomCell: UITableViewCell, NibReusable {
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(cellData: Story) {
        placeImage.sd_setImage(with: URL(string: cellData.images?.first ?? "") , placeholderImage: nil)
        contentLabel.text = cellData.title
    }
    
}
