//
//  ViewController.swift
//  Aflam
//
//  Created by Ilyasa Azmi on 24/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    let items = ["Title1", "Title1", "Title1", "Title1"]
    let dates = ["2020", "2020", "2020", "2020"]
    let descriptionText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        
        setupBarButtonItem()
        
        setupMmoviTableViewComponent()
        
    }
    
    func setupNavigationItem() {
        self.navigationItem.title = "Aflam"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupBarButtonItem() {
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease"), style: .plain, target: self, action: #selector(filterTapped))
        self.navigationItem.leftBarButtonItem = filterButton
        
        let favoriteButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoriteTapped))
        self.navigationItem.rightBarButtonItem = favoriteButton
    }
    
    func setupMmoviTableViewComponent() {
        self.movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        self.movieTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    @objc func filterTapped() {
        print("Filter Tapped")
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Choose Movie Category", preferredStyle: .actionSheet)
            
        // 2
        let popularAction = UIAlertAction(title: "Popular", style: .default)
        let upcomingAction = UIAlertAction(title: "Upcoming", style: .default)
        let topRatedAction = UIAlertAction(title: "Top Rated", style: .default)
        let nowPlayingAction = UIAlertAction(title: "Now Playing", style: .default)
            
        // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
        // 4
        optionMenu.addAction(popularAction)
        optionMenu.addAction(upcomingAction)
        optionMenu.addAction(topRatedAction)
        optionMenu.addAction(nowPlayingAction)
        optionMenu.addAction(cancelAction)
            
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @objc func favoriteTapped() {
        print("Favorite Tapped")
        self.performSegue(withIdentifier: "showFavorite", sender: self)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        cell.movieTitleLabel.text = self.items[indexPath.row]
        cell.releaseDateLabel.text = self.dates[indexPath.row]
        cell.descriptionLabel.text = self.descriptionText
        cell.movieImageView.image = UIImage(named: "default")
        
//        cell.layer.shadowColor = UIColor.gray.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        cell.layer.shadowOpacity = 1.0
//        cell.layer.masksToBounds = false
        
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    
    
}

