//
//  NewTableViewCell.swift
//  Basic_ALL_APP
//
//  Created by Guru on 19/09/23.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var immgs: UIImageView!
    

    
    @IBOutlet weak var lbl1: UILabel!
    
    
    @IBOutlet weak var lbl2: UILabel!
    
    
    @IBOutlet weak var lbl3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
      //  immgs.image = UIImage
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
