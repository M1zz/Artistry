//
//  DetailViewController.swift
//  Artistry
//
//  Created by 이현호 on 2021/05/01.
//

import UIKit

final class DetailViewController: UIViewController {

    var selectedArtist: Artist!
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        //navigationController?.navigationBar.prefersLargeTitles = false
        title = selectedArtist.name
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: .main), forCellReuseIdentifier: "DetailTableViewCell")
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell") as! DetailTableViewCell
        let artistWorks = selectedArtist.works[indexPath.row]
        cell.setDisplay(for: artistWorks)
        
        return cell
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? DetailTableViewCell else { return }
        selectedArtist.works[indexPath.row].isExpanded.toggle()
        cell.setDisplay(for: selectedArtist.works[indexPath.row])

        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
