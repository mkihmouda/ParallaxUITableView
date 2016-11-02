//
//  ViewController.swift
//  ParallaxTableView
//
//  Created by Mac on 11/2/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
 
    let imagesNameArray = ["image-0","image-1","image-2","image-3","image-4","image-5","image-6","image-7"]

    
    var parallaxOffsetSpeed : CGFloat = 40.0
    var cellHeight : CGFloat = 249.0
  
    var imageHeight : CGFloat{
    
    let maxOffset = sqrt(pow(cellHeight, 2.0) + 4 * parallaxOffsetSpeed *  self.tableView.frame.height) - cellHeight/2.0
        
        return maxOffset + cellHeight
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
 
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imagesNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ParallaxCell") as? ParallaxCell{
        
            cell.configureCell(imageName: imagesNameArray[indexPath.row])
            cell.parallaxHeighConstraints.constant = self.cellHeight
            cell.parallaxTopConstraints.constant = parallexOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
            return cell

        }
        
        return ParallaxCell()
        
    }
    
    func parallexOffset (newOffsetY : CGFloat, cell : UITableViewCell) -> CGFloat{
    
        return (newOffsetY - cell.frame.origin.y) / imageHeight * parallaxOffsetSpeed
        
    
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = self.tableView.contentOffset.y
        
        for cell in self.tableView.visibleCells as! [ParallaxCell]{
        
          cell.parallaxTopConstraints.constant = parallexOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        
        }
    
        
    }
    
}

