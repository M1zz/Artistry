//
//  MainTableViewCell.swift
//  Artistry
//
//  Created by 이현호 on 2021/04/30.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistDescriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        artistNameLabel.backgroundColor = .systemOrange
        artistNameLabel.textColor = .white
        artistDescriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func setDisplay(for artist: Artist) {
        artistImageView.image = artist.image
        artistNameLabel.text = artist.name
        artistDescriptionTextView.text = artist.bio
    }
}
