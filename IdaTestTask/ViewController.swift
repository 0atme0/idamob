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
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
        loadData()

        // Do any additional setup after loading the view, typically from a nib.
    }
    func initTable(){
        valuteTable.delegate = self
        valuteTable.dataSource = self
        refreshTable()
    }
    
    func loadData() {
        load.getDaily({
            boolLoad in
            if !boolLoad {
                self.addAlert()

            }
            self.db.loadDataFromDb({
                array in
                self.dataSource = array
                if self.dataSource.count == 0 {
                    self.addAlert()
                }
                self.valuteTable.reloadData()
                self.refreshControl.endRefreshing()

            })
        })
    }

    func refreshTable() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        valuteTable.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    func refresh(sender:AnyObject) {
        loadData()
    
    }
    
    func addAlert() {
        let alertController = UIAlertController(title: "Warning", message:
            "Connection problems!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
