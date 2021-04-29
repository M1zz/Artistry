//
//  ViewController.swift
//  Artistry
//
//  Created by 이현호 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
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
    }
}

