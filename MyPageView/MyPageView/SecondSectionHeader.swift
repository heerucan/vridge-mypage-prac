//
//  SecondSectionHeader.swift
//  MyPageView
//
//  Created by Kang Mingu on 2020/10/26.
//

import UIKit

class SecondSectionHeader: UIView {

    // MARK: - Properties
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        addSubview(line)
        addSubview(sectionLabel)
        
        backgroundColor = .white
        
        line.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 16,
                    paddingRight: 16, height: 1)
        sectionLabel.anchor(top: line.bottomAnchor, left: leftAnchor, paddingTop: 23, paddingLeft: 20)
    }
    
}
