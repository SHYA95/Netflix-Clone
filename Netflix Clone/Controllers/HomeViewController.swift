//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Shrouk Yasser on 04/02/2023.
//

import UIKit

class HomeViewController: UIViewController {
    private let HomeFeedTables: UITableView = {
        let table = UITableView()
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
         return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(HomeFeedTables)
        view.backgroundColor = .systemBackground
        
        HomeFeedTables.delegate=self
        HomeFeedTables.dataSource=self
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        HomeFeedTables.frame = view.bounds
    }
    

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 40
    }
    }
    
    
    
