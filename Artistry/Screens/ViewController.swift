//
//  ViewController.swift
//  Artistry
//
//  Created by 이현호 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    let artists = Artist.artistsFromBundle()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
    }
    
    private func configureNavigationBar() {
        let myColor = UIColor(red: 118.0/255.0, green: 158.0/255.0, blue: 71.0/255.0, alpha: 1.0)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = myColor
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white,
                                               .font: UIFont(name: "Optima-Bold", size: 46)!]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white,
                                          .font: UIFont(name: "Optima-Bold", size: 24)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: .main), forCellReuseIdentifier: "MainTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        
        let artist = artists[indexPath.row]
        cell.setDisplay(for: artist)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let destinationViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let artist = artists[indexPath.row]
        destinationViewController.selectedArtist = artist
        
        navigationController?.pushViewController(destinationViewController, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

