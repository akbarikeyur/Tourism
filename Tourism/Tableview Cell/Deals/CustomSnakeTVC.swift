//
//  CustomSnakeTVC.swift
//  Tourism
//
//  Created by Keyur on 03/12/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class CustomSnakeTVC: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var snakeCV: UICollectionView!
    var arrSnakeImg = ["snake_popcord", "snake_drink", "snake_coffee"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        snakeCV.register(UINib.init(nibName: "CustomSnakeCVC", bundle: nil), forCellWithReuseIdentifier: "CustomSnakeCVC")
    }

    //MARK:- UICollectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomSnakeCVC = snakeCV.dequeueReusableCell(withReuseIdentifier: "CustomSnakeCVC", for: indexPath) as! CustomSnakeCVC
        if indexPath.row == 0 {
            cell.outerView.layer.borderColor = YellowColor.cgColor
            cell.innerView.backgroundColor = YellowColor
            cell.totalLbl.text = "2"
            cell.plusBtn.titleLabel?.textColor = PinkColor
            cell.minusBtn.titleLabel?.textColor = PinkColor
        }else{
            cell.outerView.layer.borderColor = ExtraLightGrayColor.cgColor
            cell.innerView.backgroundColor = ExtraLightGrayColor
            cell.totalLbl.text = "0"
            cell.plusBtn.titleLabel?.textColor = PinkColor
            cell.minusBtn.titleLabel?.textColor = PinkColor
        }
        return cell
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
