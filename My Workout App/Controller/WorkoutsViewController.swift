//
//  WednesdayViewController.swift
//  My Workout App
//
//  Created by Kamil Caglar on 30/08/2022.
//

import UIKit

class WorkoutsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goExcercises" {
            if let destinationViewController = segue.destination as? ExcercisesViewController {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let workoutIndex = indexPath.row
                let selectedExcercises = workouts[workoutIndex].excercises
                destinationViewController.excercises = selectedExcercises
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}

    
extension WorkoutsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goExcercises", sender: self)
    }
}

extension WorkoutsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let workout = workouts[index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorkoutTableViewCell
        
        cell.label.text = workout.title
        cell.iconImageView.image = UIImage(named: workout.image)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

 
