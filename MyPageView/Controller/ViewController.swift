//
//  ViewController.swift
//  MyPageView
//
//  Created by Kang Mingu on 2020/10/26.
//

import UIKit

private let cellID = "CellID"

class ViewController: UIViewController {
    
    // MARK: - Properties

    let tableView = UITableView(frame: .zero, style: .grouped)
    let firstSectionMenu = ["공지사항", "브릿지란?", "앱 버전 1.0.0"]
    let secondSectionMenu = ["프로필 수정", "로그아웃"]
    
    let customNavBar = CustomNavBar()
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        navigationController?.navigationBar.isHidden = false
    }

    // MARK: - Helpers
    
    func configureUI() {
        
        view.addSubview(tableView)
        
        tableView.backgroundColor = .systemBackground // 이걸 해줘야 폰 화면 최상단 상태표시줄까지 색이 바뀜.
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuCell.self, forCellReuseIdentifier: cellID)
        
        let topHeader = TopHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 265))
                
        tableView.tableHeaderView = topHeader
        topHeader.delegate = self
        
        tableView.tableFooterView = UIView()
        
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.rightAnchor)
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return firstSectionMenu.count
        default: return secondSectionMenu.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MenuCell
        
        switch indexPath.section {
        case 0: cell.menuName.text = firstSectionMenu[indexPath.row]
        default: cell.menuName.text = secondSectionMenu[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = FirstSectionHeader()
            header.sectionLabel.text = "기본 정보"
            return header
        default:
            let header = SecondSectionHeader()
            header.sectionLabel.text = "설정"
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            
            switch indexPath.row {
            case 0:
                let controller = NoticeViewController()
                navigationController?.pushViewController(controller, animated: true)
                
            case 1: // case 0 처럼 화면 이동 코드를 작성하면 됨.
                let controller = AboutVridgeViewController()
                navigationController?.pushViewController(controller, animated: true)
                
            case 2:
                let alert = UIAlertController(title: versionCheckTitle, message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: confirm, style: .default, handler: nil))
                self.present(alert, animated: true)
                
            default: print("DEBUG: error")
            }
            
        } else {
            switch indexPath.row {
            case 0:
                let controller = EditProfileViewController()
                navigationController?.pushViewController(controller, animated: true)
                
            case 1:
                let alert = UIAlertController(title: logOutTitle, message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: logOutAnswer, style: .destructive, handler: { action in /*action 할 메서드나 코드 넣으면됨 여기에다가 */}))
                alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: nil))
                self.present(alert, animated: true)

            default: print("DEBUG: error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 28
        default: return 60
        }
    }
    
    
    
}


extension ViewController: TopHeaderViewDelegate {
    
    func seeMyPostButtonTapped() {
        let controller = MyPostViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}

