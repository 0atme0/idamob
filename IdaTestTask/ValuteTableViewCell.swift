//
//  VoluteTableViewCell.swift
//  IdaTestTask
//
//  Created by Andrey Ildyakov on 27.12.16.
//  Copyright © 2016 Andrey Ildyakov. All rights reserved.
//

import UIKit

class ValuteTableViewCell: UITableViewCell {
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(cell:Valute) {
        value.text = cell.nominal
        name.text = cell.name
        
    }

}
