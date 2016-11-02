//
//  ParallaxCell.swift
//  ParallaxTableView
//
//  Created by Mac on 11/2/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class ParallaxCell: UITableViewCell {

    @IBOutlet var parallaxImageView: UIImageView!
    @IBOutlet var parallaxTitle: UILabel!
    @IBOutlet var parallaxHeighConstraints: NSLayoutConstraint!
    @IBOutlet var parallaxTopConstraints: NSLayoutConstraint!
    
  
    func  configureCell(imageName: String){
    
     parallaxImageView.image = UIImage.init(named: imageName)
     parallaxTitle.text = imageName
    
    }
    
    override func awakeFromNib() {
        
        parallaxImageView.clipsToBounds = true
        
    }
    
    
}
