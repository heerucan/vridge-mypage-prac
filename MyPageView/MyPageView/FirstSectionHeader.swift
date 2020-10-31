//
//  SectionHeader.swift
//  MyPageView
//
//  Created by Kang Mingu on 2020/10/26.
//

import UIKit

class FirstSectionHeader: UIView {
    
    // MARK: - Properties
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13)
        return label
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
        
        backgroundColor = .white
        
        addSubview(sectionLabel)
        
        sectionLabel.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 20)
        
    }

}
