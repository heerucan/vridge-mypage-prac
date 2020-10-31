//
//  testHeader.swift
//  MyPageView
//
//  Created by Kang Mingu on 2020/10/26.
//

import UIKit

protocol TopHeaderViewDelegate: class {
    func seeMyPostButtonTapped()
}

class TopHeaderView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: TopHeaderViewDelegate?
    
    let typeColorView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "배주현"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "@vegan"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let profielBg : UIView = {
        let view = UIView()
        view.setDimensions(height: 48, width: 48)
        view.layer.cornerRadius = 48 / 2
        view.backgroundColor = .white
        return view
    }()
    
    let profileImage : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 44 / 2 // 가장자리를 둥글게 원으로 하려면 heightAnchor 값의 절반으로 하면 됨
        iv.clipsToBounds = true // 프로필 이미지가 이미지뷰 백그라운드 안에 들어가게 해주려면
        return iv
    }()
    
    let whiteRect: UIView = {
        let view = UIView()
        view.setDimensions(height: 126, width: 343)
        view.layer.cornerRadius = 18
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 18
        return view
    }()
    
    let myPostTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 채식 참여 횟수"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let myPostCountLabel: UILabel = {
        let label = UILabel()
        label.text = "23"
        label.font = .boldSystemFont(ofSize: 50)
        return label
    }()
    
    let myPostCountUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "끼 째"
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    let seeMyPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "btnSeeMyposts"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 64 / 2
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.20
        button.layer.shadowRadius = 12
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Selectors
    
    @objc func handleButtonTapped() {
        delegate?.seeMyPostButtonTapped()
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        addSubview(typeColorView)
        addSubview(usernameLabel)
        addSubview(typeLabel)
        addSubview(profielBg)
        addSubview(profileImage)
        addSubview(whiteRect)
        addSubview(myPostTitleLabel)
        addSubview(myPostCountLabel)
        addSubview(myPostCountUnitLabel)
        addSubview(seeMyPostButton)
        backgroundColor = .white
        
        typeColorView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 152)
        usernameLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 18, paddingLeft: 16)
        typeLabel.anchor(top: usernameLabel.bottomAnchor, left: leftAnchor, paddingLeft: 18)
        profielBg.anchor(top: topAnchor, right: rightAnchor, paddingTop: 11, paddingRight: 16)
        profileImage.anchor(top: topAnchor, right: rightAnchor, paddingTop: 13, paddingRight: 18, width: 44, height: 44)
        whiteRect.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, paddingTop: 27, paddingLeft: 16)
        myPostTitleLabel.anchor(top: whiteRect.topAnchor, left: whiteRect.leftAnchor, paddingTop: 18, paddingLeft: 20)
        myPostCountLabel.anchor(top: myPostTitleLabel.bottomAnchor, left: whiteRect.leftAnchor, paddingTop: 4, paddingLeft: 20)
        myPostCountUnitLabel.anchor(top: myPostTitleLabel.bottomAnchor, left: myPostCountLabel.rightAnchor, paddingTop: 23, paddingLeft: 5)
        seeMyPostButton.anchor(top: whiteRect.topAnchor, left: myPostTitleLabel.rightAnchor, paddingTop: 32, paddingLeft: 107, width: 64, height: 64)
        
    }

}
