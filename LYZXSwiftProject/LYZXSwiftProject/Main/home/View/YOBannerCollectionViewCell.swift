//
//  YOBannerCollectionViewCell.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/18.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import Kingfisher

class YOBannerCollectionViewCell: UICollectionViewCell {
    
    
      private var bannerView: UIImageView = {
          let imageView = UIImageView()
          return imageView
      }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpChildUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setUpChildUI() {
        
        self.contentView.addSubview(self.bannerView)
        self.bannerView.snp.makeConstraints { (make) in
            
            make.left.right.top.bottom.equalToSuperview()
            
        }
        
    }
    
    var bannerModel:HomeBannerModel?{
        
        didSet{
            
            guard let model = bannerModel else { return }
            self.bannerView.kf.setImage(with: URL.init(string: model.homeTopBannerUrl!))
            
        }

        
    }
    
    
    
    
}
