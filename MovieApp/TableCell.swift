//
//  TableCell.swift
//  MovieApp
//
//  Created by Appinventiv on 27/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
 
    var section2Images = ["s51","s21","s53","s22","s55","s23","s52","s25","s54","s21"]
    var section3Images = ["s24","s21","s45","s41","s42","s22","s23","s44","s45","s25"]
    var section4Images = ["s41","s42","s43","s44","s45","s41","s42","s43","s44","s45"]
     var section5Images = ["s21","s22","s23","s24","s25","s44","s41","s23","s24","s25"]
    var currentSection : Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if currentSection == 1{
            if(indexPath.item % 2 == 0)
            {
                return CGSize(width: collectionView.frame.width/2 , height: collectionView.frame.height)
            }
            else
            {
                return CGSize(width: collectionView.frame.width/4 , height: collectionView.frame.height)
            }
       }
        else{
            return CGSize(width:collectionView.frame.width/4,height:collectionView.frame.height)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCellid", for: indexPath) as! MovieCell
        
        switch(currentSection){
        case 1:
         cell.movieImage.image = UIImage(named : section2Images[indexPath.item])
        case 2:
         cell.movieImage.image = UIImage(named : section3Images[indexPath.item])
        case 3:
            cell.movieImage.image = UIImage(named : section4Images[indexPath.item])
        case 4:
             cell.movieImage.image = UIImage(named : section5Images[indexPath.item])
        default:
            print("default")
        }
        return cell
    }
   

}
