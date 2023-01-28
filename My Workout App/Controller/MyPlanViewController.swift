//
//  MyPlanViewController.swift
//  My Workout App
//
//  Created by Kamil Caglar on 16/01/2023.
//

import UIKit

class MyPlanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var myPlanExercise = ExcercisesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPlanExercise.workoutExercises = DataManager.shared.exercises()
        tableView.reloadData()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myPlanExercise.workoutExercises = DataManager.shared.exercises()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Swipe left to delete current row.
        
        let delete = UIContextualAction(style: .destructive , title: "Delete") {(action, view, completionHandler) in
            let index = indexPath.row
            let excerciseToRemove = self.myPlanExercise.workoutExercises[index]
            // remove
            tableView.beginUpdates()
            DataManager.shared.persistentContainer.viewContext.delete(excerciseToRemove)
            self.myPlanExercise.workoutExercises.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .fade)
            DataManager.shared.save()
            tableView.endUpdates()
            // re-fetch data
            //DataManager.shared.exercises()
            completionHandler(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = UIColor.red
        
        // swipe
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        
        return swipe
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPlanExercise.workoutExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let exercise = myPlanExercise.workoutExercises[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyPlanTableViewCell
        cell.label.text = exercise.title
        cell.exerciseImageView.image = UIImage(named: exercise.image!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
