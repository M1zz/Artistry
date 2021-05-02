//
//  DetailTableViewCell.swift
//  Artistry
//
//  Created by 이현호 on 2021/05/01.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var DetailImageVIew: UIImageView!
    @IBOutlet private weak var artnameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setDisplay(for artist: Work) {
        DetailImageVIew.image = artist.image
        artnameLabel.text = artist.title
        descriptionLabel.text = artist.isExpanded ? artist.info : "Select For More Info >"
    }
}
