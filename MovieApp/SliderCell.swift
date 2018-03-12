//
//  SliderCell.swift
//  MovieApp
//
//  Created by Appinventiv on 27/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class SliderCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageOutlet: UIPageControl!
       //var timer : Timer!
    var arrayOfImages = ["s1","s2","s3","s4","s5"]
   
    override func awakeFromNib() {
        super.awakeFromNib()
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
       Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollAutomatically(_:)), userInfo: nil, repeats: true)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        print(pageOutlet.currentPage)
        sliderCollectionView.scrollRectToVisible(CGRect(x : Int(self.sliderCollectionView.frame.size.width) * self.pageOutlet.currentPage,y
            : 0,width : Int(self.sliderCollectionView.frame.size.width),height : Int(self.sliderCollectionView.frame.size.height)), animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: sliderCollectionView.frame.width , height: sliderCollectionView.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCollectionViewCellid", for: indexPath) as! SliderCollectionViewCell
        cell.sliderImage.image = UIImage(named : arrayOfImages[indexPath.item])
        return cell
    }
        
    @objc func scrollAutomatically(_ timer1: Timer) {
        if let temporaryView  = sliderCollectionView {
            for cell in temporaryView.visibleCells {
                let indexPath: IndexPath? = temporaryView.indexPath(for: cell)
                if ((indexPath?.item)!  < arrayOfImages.count - 1){
                    let temporaryIndexPath: IndexPath?
                    print(indexPath!)
                    temporaryIndexPath = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    temporaryView.scrollToItem(at: temporaryIndexPath!, at: .right, animated: true)
                }
                else{
                    let temporaryIndexPath: IndexPath?
                    print(indexPath!)
                    temporaryIndexPath = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    temporaryView.scrollToItem(at: temporaryIndexPath!, at: .left, animated: true)
                }
                
            }
        }
    }
    
} // main class close

extension SliderCell : UIPageViewControllerDelegate{
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageOutlet.currentPage = indexPath.item
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageOutlet.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
