//
//  ViewController.swift
//  Quickbytes Example Swift
//
//  Created by Aaron Brethorst on 9/25/17.
//  Copyright © 2017 Quickbytes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        self.tableView.frame = self.view.bounds
        self.tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    static let cellReuseIdentifier = "identifier"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellReuseIdentifier)

        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: ViewController.cellReuseIdentifier)
        }

        cell?.textLabel?.text = indexPath.description

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "You Clicked on a Row!", message: indexPath.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
