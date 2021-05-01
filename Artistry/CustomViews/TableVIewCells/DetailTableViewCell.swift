//
//  DetailTableViewCell.swift
//  Artistry
//
//  Created by 이현호 on 2021/05/01.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var DetailImageVIew: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDisplay(for artist: Work) {
        DetailImageVIew.image = artist.image
    }
}
