//
//  ViewController.swift
//  IdaTestTask
//
//  Created by Andrey Ildyakov on 27.12.16.
//  Copyright © 2016 Andrey Ildyakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    let load = Loader()
    let db = DbLoad()
    var dataSource : [Valute] = []
    @IBOutlet weak var valuteTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
        loadData()

        // Do any additional setup after loading the view, typically from a nib.
    }
    func initTable(){
        valuteTable.delegate = self
        valuteTable.dataSource = self
    }
    
    func loadData() {
        load.getDaily({
            _ in
            self.db.loadDataFromDb({
                array in
                self.dataSource = array
                self.valuteTable.reloadData()
            })
        })
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("valuteCell", forIndexPath: indexPath) as! ValuteTableViewCell
        cell.config(dataSource[indexPath.row])
        
        return cell
    }
    
    
    
}
