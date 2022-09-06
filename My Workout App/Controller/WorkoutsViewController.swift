//
//  WednesdayViewController.swift
//  My Workout App
//
//  Created by Kamil Caglar on 30/08/2022.
//

import UIKit

class WorkoutsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
    
    
    // name is items
    
    var data: [Category] = [
        Category(title: "Legs", items: ["Barbell Squat","Seated Leg Extension","Seated Hamstring Curl","Calf Raises"]),
        Category(title: "Shoulders", items: ["Overhead Press","Seated Lateral Raise","Bent-over Reverse Flye","Seated Arnold Press"]),
        Category(title: "Traps", items: ["Dumbell Shrug","Upright Row"]),
        Category(title: "Back", items: ["Pull-up","Seated row","Bent-over row","Wide-grip Lat Pull-down"]),
        Category(title: "Triceps", items: ["Dips","Close Grip Bench Press","Pushdown","Lying Triceps Extensions","Dumbbell Kickback"]),
        Category(title: "Core", items: ["Dumbbell Crunch","Seated Russian Twist","Pulse Up","Hanging Leg Raises"]),
        Category(title: "Chest", items: ["Bech Press","Incline Bench Press","Decline Bench Press","Incline Dumbbell Flye","Cable Crossover"]),
        Category(title: "Biceps", items: ["Dumbbell Curl","Hammer Curl","21's"]),
        Category(title: "Core", items: ["Dumbbell Crunch","Seated Russian Twist","Pulse Up","Hanging Leg Raises"])
        
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
//            self.data.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//        return [deleteAction]
//    }
}
    
extension WorkoutsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = data[indexPath.row]
        
        let vc = WorkoutsListViewController(items: category.items)
        vc.title = category.title
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

extension WorkoutsViewController: UITableViewDataSource {
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

    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


