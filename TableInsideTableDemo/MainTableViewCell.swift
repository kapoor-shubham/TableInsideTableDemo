//
//  MainTableViewCell.swift
//  TableInsideTableDemo
//
//  Created by Shubham Kapoor on 14/11/18.
//  Copyright © 2018 Shubham Kapoor. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subCategory1TableView: UITableView!
    @IBOutlet weak var subCategory2TableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//extension MainTableViewCell: UITableViewDataSource, CellSelectedData {

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
