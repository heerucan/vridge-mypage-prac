//
//  NoticeCell.swift
//  MyPageView
//
//  Created by 김루희 on 2020/10/29.
//

import UIKit

class NoticeCell: UITableViewCell {

    
    // MARK: - Properties
    
    
    let noticeListTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    let noticeListDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.setDimensions(height: 1, width: 375)
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(noticeListTitle)
        addSubview(noticeListDate)
        addSubview(lineView)
        
        noticeListTitle.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 63)
        noticeListDate.anchor(top: noticeListTitle.bottomAnchor, left: leftAnchor, paddingTop: 5, paddingLeft: 20)
        lineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}


