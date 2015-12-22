//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Li Yin on 11/13/15.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var history: [RPSMatch]!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
        
        let match = self.history[indexPath.row]
        cell.textLabel!.text = victoryStatusDescription(match)
        cell.detailTextLabel!.text = "\(match.p1) VS \(match.p2)"
        
        return cell
    }
    
    func victoryStatusDescription(match: RPSMatch) -> String {
        
        if (match.p1 == match.p2){
            return "It's a tie."
        } else if (match.p1.defeats(match.p2)){
            return "you win!"
        } else {
            return "you lose."
        }
    }
    @IBAction func dissMiss(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}