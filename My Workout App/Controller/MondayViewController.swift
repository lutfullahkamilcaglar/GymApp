//
//  MondayViewController.swift
//  My Workout App
//
//  Created by Kamil Caglar on 30/08/2022.
//

import UIKit


class MondayViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
//    let table = UITableView()
    
//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
    
    var data: [Category] = [
        Category(title: "Legs", items: ["Barbell Squat","Seated Leg Extension","Seated Hamstring Curl","Calf Raises"]),
        Category(title: "Shoulders", items: ["Overhead Press","Seated Lateral Raise","Bent-over Reverse Flye","Seated Arnold Press"]),
        Category(title: "Traps", items: ["Dumbell Shrug","Upright Row"])
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // The tableView editing
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
//            self.data.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//        return [deleteAction]
//    }
    
    

    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.data.remove(at: indexPath.row)
            tableView.endUpdates()
        }
    }

    
}


extension MondayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = data[indexPath.row]
        
        let vc = MondayListViewController(items: category.items)
        vc.title = category.title
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

extension MondayViewController: UITableViewDataSource {
    // tableView editing
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
    
}


