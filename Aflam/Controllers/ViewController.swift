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
        
        self.navigationItem.title = "Aflam"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        self.movieTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
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
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}

