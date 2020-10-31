//
//  CustomNavBar.swift
//  MyPageView
//
//  Created by 김루희 on 2020/10/29.
//

import UIKit

protocol CutomNavBarDelegate: class {
    func backButtonDidTap()
}

class CustomNavBar: UIView {

    //MARK: - Properties
    weak var delegate: CutomNavBarDelegate?
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "공지사항"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "btnBack"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.setDimensions(height: 0.5, width: 375)
        view.backgroundColor = .systemGray
        
        return view
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(lineView)
        
        titleLabel.centerX(inView: self)
        titleLabel.centerY(inView: self)
        
        backButton.anchor(top: topAnchor, left: leftAnchor)
        
        lineView.anchor(top: bottomAnchor, left: leftAnchor, right: rightAnchor)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func backButtonDidTap() {
        delegate?.backButtonDidTap()
    }
}
