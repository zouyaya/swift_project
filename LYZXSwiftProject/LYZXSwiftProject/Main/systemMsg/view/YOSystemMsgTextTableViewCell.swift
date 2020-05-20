//
//  YOSystemMsgTextTableViewCell.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/19.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOSystemMsgTextTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    class func initCellWithTableView(with tableView:UITableView) ->YOSystemMsgTextTableViewCell {
        
        let identify = "YOSystemMsgTextTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identify) as? YOSystemMsgTextTableViewCell
        if cell == nil {
            
            cell = YOSystemMsgTextTableViewCell.init(style: .default, reuseIdentifier: identify)
            cell?.selectionStyle = .none
            tableView.separatorStyle = .none
            cell?.backgroundColor = .colorWithHexString("0xf4f4f4", alpha: 1)

        }
    
        return cell!;
        
    }
    
    
    private var bgView: UIView = {
        
        
        let backgrountView = UIView()
        backgrountView.backgroundColor = .clear
        return backgrountView
        
    }()
    
    
    
    private var showInfoView: UIView = {
       
        let showVIew = UIView()
        showVIew.layer.cornerRadius = 10;
        showVIew.clipsToBounds = true;
        showVIew.layer.borderColor = UIColor.init(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0).cgColor
        showVIew.layer.borderWidth = 0.5;
        showVIew.backgroundColor = .white
        showVIew.layer.shadowColor = UIColor.colorWithHexString("0x000000", alpha: 0.02).cgColor
        showVIew.layer.shadowOffset = CGSize(width: 0, height: 2)
        showVIew.layer.shadowRadius = 8;
        showVIew.layer.shadowOpacity = 1;
        return showVIew
    }()
    
    
    
    private var timeLabel :UILabel = {
        
       let timeable = UILabel()
        timeable.textAlignment = .center
        timeable.font = .systemFont(ofSize: 12)
        timeable.text = "8小时前"
        timeable.textColor = .colorWithHexStringWithoutAlpha("0x999999")
       return timeable
        
    }()
    
    private var titleLabel: UILabel = {
       
        let biaotiLabel = UILabel()
        biaotiLabel.textColor = .colorWithHexStringWithoutAlpha("0x333333")
        biaotiLabel.font = UIFont.boldSystemFont(ofSize: 17)
        biaotiLabel.text = "系统消息"
    
        return biaotiLabel
        
    }()
    
    
    private var detailLabel :UILabel = {
       
        let detable = UILabel()
        detable.textColor = .colorWithHexStringWithoutAlpha("0x666666")
        detable.font = UIFont.systemFont(ofSize: 16)
        detable.numberOfLines = 0
        return detable
        
    }()
    
    
    private var lineView:UIView = {
       
        let separteLIne = UIView()
        separteLIne.backgroundColor = .colorWithHexStringWithoutAlpha("0xececec")
        return separteLIne
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setUpChildVC()
        
    }
    

    
    func setUpChildVC() {
        
        
        self.contentView.addSubview(self.bgView)
        self.bgView.snp.makeConstraints { (make) in
            
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(15)
        }
        
        
        self.contentView.addSubview(self.showInfoView)
        self.showInfoView.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
            make.top.equalTo(self.bgView.snp_top).offset(30)
            
        }
        
        self.contentView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            
            make.centerX.top.equalTo(self.bgView)
            make.width.equalTo(self.showInfoView.snp_width)
            make.bottom.equalTo(self.showInfoView.snp_top)
            
        }
        
        
        self.contentView.addSubview(self.detailLabel)
       
        
        self.contentView.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.showInfoView).offset(12)
            make.right.equalTo(self.showInfoView).offset(-12)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(1)
            
        }
        
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.lineView)
            make.centerY.equalTo(self.lineView.snp_bottom).offset(25)
            make.height.equalTo(30)
            
        }
        
        
        
    }
    
    
    var messageModel:BlueModel?{
        
        didSet{
            
            guard let model = messageModel else {
                
                return
            }
             self.titleLabel.text = model.title
            self.detailLabel.attributedText = NSMutableAttributedString.init(string: model.msgContent!, attributes: getAttributeDic() as? [NSAttributedString.Key : Any])
        }
    
       
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let textheight = getDetailInfotextHeight(self.messageModel?.msgContent ?? "", dict: getAttributeDic(), width: K_ScreenWidth - 54)
        self.detailLabel.frame = CGRect(x: 27, y: 65, width: K_ScreenWidth - 54, height: textheight);
    }
    
    
    private func getAttributeDic()->NSMutableDictionary{
        
        let dict = NSMutableDictionary()
        dict.setValue(UIColor.colorWithHexStringWithoutAlpha("0x666666"), forKey: NSAttributedString.Key.foregroundColor.rawValue)
        dict.setValue(UIFont.systemFont(ofSize: 16), forKey: NSAttributedString.Key.font.rawValue)
        let parastyle = NSMutableParagraphStyle.init()
        parastyle.lineSpacing = 7
        parastyle.firstLineHeadIndent = 0
        dict.setValue(parastyle, forKey: NSAttributedString.Key.paragraphStyle.rawValue)
        return dict
    }
    
    
    private func getDetailInfotextHeight(_ str :String,dict:NSMutableDictionary,width:CGFloat) ->CGFloat{
        
        var textHeigth:CGFloat = 0
        textHeigth = (str as NSString).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: dict as? [NSAttributedString.Key : Any], context: nil).height
        
        return textHeigth
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
