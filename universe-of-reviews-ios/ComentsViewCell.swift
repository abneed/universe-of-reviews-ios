//
//  ComentsViewCell.swift
//  universe-of-reviews-ios
//
//  Created by Sistemas on 6/7/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import UIKit

class ComentsViewCell: UITableViewCell {

    @IBOutlet weak var imgPerfil: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblComentario: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
