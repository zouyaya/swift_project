//
//  YOSystemMsgPicTableViewCell.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/20.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOSystemMsgPicTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    class func initCellWithTableView(with taleView :UITableView) -> YOSystemMsgPicTableViewCell {
        
        let identify = "YOSystemMsgPicTableViewCell"
        
        
        
        var cell:YOSystemMsgPicTableViewCell? = taleView.dequeueReusableCell(withIdentifier: identify) as? YOSystemMsgPicTableViewCell
        if cell == nil {
            
            cell = YOSystemMsgPicTableViewCell.init(style: .default, reuseIdentifier: identify) 
            cell?.selectionStyle = .none
            taleView.separatorStyle = .none
            cell?.backgroundColor = .colorWithHexStringWithoutAlpha("0xf4f4f4")
        }
        
        return cell!
        
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpChildUI()
        
    }
    
    
    private var bgView:UIView = {
       
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        return backgroundView
    }()
    
    
    private var showView:UIView = {
        
        let showInfoView = UIView()
        showInfoView.layer.cornerRadius = 10;
        showInfoView.clipsToBounds = true;
        showInfoView.layer.borderColor = UIColor.init(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0).cgColor
        showInfoView.layer.borderWidth = 0.5;
        showInfoView.backgroundColor = .white
        showInfoView.layer.shadowColor = UIColor.colorWithHexString("0x000000", alpha: 0.02).cgColor
        showInfoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        showInfoView.layer.shadowRadius = 8;
        showInfoView.layer.shadowOpacity = 1;
        return showInfoView
        
    }()

    
    
    private var timeLabel :UILabel = {
        
        let timeShowLabel = UILabel()
        timeShowLabel.textAlignment = .center
        timeShowLabel.font = .systemFont(ofSize: 12)
        timeShowLabel.text = "8小时前"
        timeShowLabel.textColor = .colorWithHexStringWithoutAlpha("0x999999")
        return timeShowLabel
        
    }()
    
    
    
    private var iconImageView: UIImageView = {
        
        let iconView = UIImageView()
        iconView.backgroundColor = k_CarQIColor
        return iconView
        
        
    }()
    
    
    private var titleInfoLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = .colorWithHexStringWithoutAlpha("0x333333")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.text = "五一节前物流通知到货"
        return titleLabel
        
    }()
    
    private var unReadFlagView :UIImageView = {
        
        let newFlagView = UIImageView()
        let image = UIImage(named: "最新未读")
        newFlagView.image = image
        return newFlagView
        
    }()
    
    func setUpChildUI() {
        
        self.contentView.addSubview(self.bgView)
        self.bgView.snp.makeConstraints { (make) in
            
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            
        }
        
        self.contentView.addSubview(self.showView)
        self.showView.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
            make.top.equalTo(self.bgView.snp_top).offset(30)
            
        }
        
        
        self.contentView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            
            make.centerX.top.equalTo(self.bgView)
            make.width.equalTo(self.showView.snp_width)
            make.bottom.equalTo(self.showView.snp_top)
            
        }
        
        self.contentView.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints { (make) in
            
            make.left.top.equalTo(self.showView).offset(12)
            make.right.equalTo(self.showView.snp_right).offset(-12)
            make.bottom.equalTo(self.showView.snp_bottom).offset(-50)
        }
        
        self.contentView.addSubview(self.titleInfoLabel)
        
        
        
        self.contentView.addSubview(self.unReadFlagView)
        self.unReadFlagView.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.titleInfoLabel.snp_right).offset(10)
            make.centerY.equalTo(self.titleInfoLabel.snp_centerY)
            make.width.height.equalTo(30)
        }
        
    }
    
    
    
    var systemModel :BlueModel?{
        
        didSet{
            
            guard let model = systemModel else {
                
                return
            }
            
            titleInfoLabel.text = model.title
            guard model.icon != nil else {

                iconImageView.image = UIImage(named: "系统消息占位图")
                return
            }
            iconImageView.kf.setImage(with: URL.init(string: model.icon!))
            if model.readFlag == "1"{
                
                unReadFlagView.isHidden = true
                
            }else{
                unReadFlagView.isHidden = false
            }
            
        }
        
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let titleWidth = (titleInfoLabel.text as NSString?)?.stringWithFrontReturnSize(size: CGSize(width: K_ScreenWidth - 54, height: CGFloat(MAXFLOAT)), font: UIFont.boldSystemFont(ofSize: 16)).width
        titleInfoLabel.frame = CGRect(x: 30, y: self.frame.size.height - 40, width: titleWidth ?? 0, height: 25)
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
