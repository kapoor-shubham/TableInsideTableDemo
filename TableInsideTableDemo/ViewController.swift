//
//  ViewController.swift
//  TableInsideTableDemo
//
//  Created by Shubham Kapoor on 14/11/18.
//  Copyright © 2018 Shubham Kapoor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var mainTableArray = ["Table 1", "Table 2", "Table 3", "Table 4", "Table 5", "Table 6", "Table 7"]
    
    var subCat1Array = [["1", "2", "3"], ["4", "5", "6"], ["1", "2", "3"], ["4", "5", "6"], ["1", "2", "3"], ["4", "5", "6"], ["1", "2", "3"]]
    
    var subCat2Array = [["4", "5", "6"], ["1", "2", "3"], ["4", "5", "6"], ["1", "2", "3"], ["4", "5", "6"], ["1", "2", "3"], ["4", "5", "6"]]
    
    var subCategory1Array: [String]? {
        didSet {
            mainTableView.reloadData()
        }
    }
    
    var subCategory2Array: [String]?
    
    var cellSelectedIndex: Int?
    var previousSelectedCellIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func sectionSelectionAction() {
        
        if previousSelectedCellIndex != nil && previousSelectedCellIndex != cellSelectedIndex {
            previousSelectedCellIndex = cellSelectedIndex
            print("Expand the cell at section: \(cellSelectedIndex!)")
        } else if previousSelectedCellIndex == nil {
            previousSelectedCellIndex = cellSelectedIndex
            print("Expand the cell at section: \(cellSelectedIndex!)")
            subCategory1Array = subCat1Array[cellSelectedIndex!]
            subCategory2Array = subCat2Array[cellSelectedIndex!]
        } else {
            print("Collapse the cell at section: \(cellSelectedIndex!)")
            previousSelectedCellIndex = nil
            cellSelectedIndex = nil
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainTableArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if cellSelectedIndex != nil {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: mainTableView.frame.size.width, height: 50))
        cellSelectedIndex = section
        
        let mainTextLabel = UILabel(frame: CGRect(x: 20, y: ((50/2) - 12.5), width: 100, height: 25))   // returns (x: 20, y: (sectionHeight/2 - labelHeight/2), width: 100, height: 25)
        mainTextLabel.text = mainTableArray[section]
        view.addSubview(mainTextLabel)
        
        
        let subText1Label = UILabel(frame: CGRect(x: 150, y: ((50/2) - 12.5), width: 80, height: 25))
        
        if let sub1Array = subCategory1Array, sub1Array.indices.contains(section) {
            subText1Label.text = sub1Array[section]
        } else {
            subText1Label.text = "Nil"
        }
       
        view.addSubview(subText1Label)
        
        
        let subText2Label = UILabel(frame: CGRect(x: 250, y: ((50/2) - 12.5), width: 80, height: 25))
        if let sub2Array = subCategory2Array, sub2Array.indices.contains(section) {
            subText2Label.text = sub2Array[section]
        } else {
            subText2Label.text = "Nil"
        }
        view.addSubview(subText2Label)
        
        
        let selectionButton = UIButton(frame: CGRect(x: 0, y: 0, width: mainTableView.frame.size.width, height: 50))
        selectionButton.addTarget(self, action: #selector(sectionSelectionAction), for: .touchUpInside)
        view.addSubview(selectionButton)
        
        return view
    }
}

