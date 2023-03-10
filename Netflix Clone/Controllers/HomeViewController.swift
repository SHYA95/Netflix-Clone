//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Shrouk Yasser on 04/02/2023.
//

import UIKit
let sectionTitles:[String] = ["Trending movies","Popular","Trending TV","Upcoming movies","Top rated"]


class HomeViewController: UIViewController {
    private let HomeFeedTables: UITableView = {
     
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
         return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(HomeFeedTables)
        view.backgroundColor = .systemBackground
        
        HomeFeedTables.delegate=self
        HomeFeedTables.dataSource=self
        
        configureNavBar()
        
        let headerView = HeroHeaderUiView(frame: CGRect(x:  0, y: 0, width: view.bounds.width, height: 450))
        HomeFeedTables.tableHeaderView = headerView
    }
    
    private func configureNavBar(){
            
            var image = UIImage(named: "netflix_logo")
            image = image?.withRenderingMode(.alwaysOriginal)
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done , target: self, action: nil)
        
            navigationItem.rightBarButtonItems = [ UIBarButtonItem(image:UIImage(systemName: "person") , style: .done, target: self, action: nil) , UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
        
        }



    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        HomeFeedTables.frame = view.bounds
    }
    

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)  {
        guard let header = view as?UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x+20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.tintColor = .white
        
    }
    
    
    
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sectionTitles[section]
        }
        
    //for hidden the navbar when scrolling the screen
    //custom algorisem
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let defaultOffset = view.safeAreaInsets.top
            let offset = scrollView.contentOffset.y + defaultOffset
            navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
        }
    }

