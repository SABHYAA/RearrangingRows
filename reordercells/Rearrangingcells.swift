//
//  Rearrangingcells.swift
//  reordercells
//
//  Created by appinventiv on 28/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Rearrangingcells: UIViewController {

    @IBOutlet var mytableview: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var numbers = ["one", "two", "three", "four", "five"]
    @IBAction func editBtn(_ sender: UIBarButtonItem)
    {
        mytableview.isEditing = !mytableview.isEditing
        switch mytableview.isEditing {
        case true:
            editButton.title = "done"
        case false:
            editButton.title = "edit"
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       self.mytableview.dataSource = self
       self.mytableview.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    extension Rearrangingcells : UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return numbers.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as? Customcell else{
                fatalError()
            }
            cell.textLabel?.text = numbers[indexPath.row]
            return cell
        }
        // Allows Reordering of cells
        internal func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
            let itemToMove = numbers[fromIndexPath.row]
            numbers.remove(at: fromIndexPath.row)
            numbers.insert(itemToMove, at: toIndexPath.row)
        }
    }


class  Customcell: UITableViewCell {
    

}

