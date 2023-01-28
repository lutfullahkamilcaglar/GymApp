//
//  WednesdayListViewController.swift
//  My Workout App
//
//  Created by Kamil Caglar on 03/09/2022.
//

import UIKit
import CoreData

class ExcercisesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Data for table
    var excercises: [ExcerciseModel] = []
    var workoutExercises: [Exercises] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return excercises.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let excercise = excercises[index]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseTableViewCell
        
        cell.exerciseLabel.text = excercise.title
        cell.exerciseImageView.image = UIImage(named: excercise.image)

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Swipe left to add exercises to MyPlan
        
        let add = UIContextualAction(style: .normal , title: "Add") {(action, view, completionHandler) in
            let index = indexPath.row
            let excercise = self.excercises[index]
            // check if exercise already exists in the workoutExercises array
            let existingExercise = self.workoutExercises.filter { $0.title == excercise.title }
            
            if existingExercise.count == 0 {
                // save exercises in row
                let exercise = DataManager.shared.exercise(title: excercise.title, image: excercise.image)
                self.workoutExercises.append(exercise)
                DataManager.shared.save()
                completionHandler(true)
            }else{
                completionHandler(false)
            }
//            // save exercises in row
//            let exercise = DataManager.shared.exercise(title: excercise.title, image: excercise.image)
//            self.workoutExercises.append(exercise)
//            DataManager.shared.save()
            
        }
        add.image = UIImage(systemName: "plus.circle")
        add.backgroundColor = UIColor(named: "swipeColor")
        
        // swipe
        let swipe = UISwipeActionsConfiguration(actions: [add])
        
        return swipe
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
