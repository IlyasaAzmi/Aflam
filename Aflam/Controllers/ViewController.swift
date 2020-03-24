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
    
    let items = ["Item1", "Item2", "Item3", "Item4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Aflam"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
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

        cell.movieTitleLabel.text = items[indexPath.row]
        cell.movieImageView.image = UIImage(systemName: "lock")
        

        return cell
    }
    
    
    
    
}

