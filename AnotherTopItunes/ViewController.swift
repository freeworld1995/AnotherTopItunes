//
//  ViewController.swift
//  TopItunes
//
//  Created by Jimmy Hoang on 1/27/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        registerNib()
        
        dataSource.getData {
            self.tableView.reloadData()
        }
    }
    
    func registerNib() {
        tableView.register(UINib(nibName: "SongCell", bundle: nil), forCellReuseIdentifier: "SongCell")
    }
    
    func setup() {
        self.definesPresentationContext = true
        tableView.delegate = self
        tableView.dataSource = dataSource
        self.tableView.estimatedRowHeight = 200
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            cell.alpha = 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}

