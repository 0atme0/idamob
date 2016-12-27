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
    @IBOutlet weak var valuteTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
        load.getDaily()
        db.count()

        // Do any additional setup after loading the view, typically from a nib.
    }
    func initTable(){
        valuteTable.delegate = self
        valuteTable.dataSource = self
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("valuteCell", forIndexPath: indexPath) as! ValuteTableViewCell
 
        
        return cell
    }
    
    
    
}
