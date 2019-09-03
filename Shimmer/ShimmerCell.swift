//
//  ShimmerView.swift
//  Shimmer
//
//  Created by tskim on 03/09/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class ShimmerCell: UITableViewCell, NibForName {
    
    @IBOutlet weak var shimmerImageView: UIImageView!
    @IBOutlet weak var shimmerTitleView: UILabel!
    @IBOutlet weak var shimmerSubTitleView: UILabel!
    @IBOutlet weak var shimmerDateView: UILabel!
    
    
    func startShimmerAnimation() {
        let bgColor  = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.5)
        shimmerImageView.backgroundColor = bgColor
        shimmerImageView.startShimmering()
        shimmerImageView.image = nil
        
        shimmerTitleView.backgroundColor = bgColor
        shimmerTitleView.text = " "
        shimmerTitleView.startShimmering()
        
        shimmerSubTitleView.backgroundColor = bgColor
        shimmerSubTitleView.text = " "
        shimmerSubTitleView.startShimmering()
        
        shimmerDateView.backgroundColor = bgColor
        shimmerDateView.text = " "
        shimmerDateView.startShimmering()
    }
    
    func stopShimmerAnimation() {
        shimmerImageView.backgroundColor = nil
        shimmerImageView.stopShimmering()
        
        shimmerTitleView.backgroundColor = nil
        shimmerTitleView.stopShimmering()
        
        shimmerSubTitleView.backgroundColor = nil
        shimmerSubTitleView.stopShimmering()
        
        shimmerDateView.backgroundColor = nil
        shimmerDateView.stopShimmering()
    }
}
