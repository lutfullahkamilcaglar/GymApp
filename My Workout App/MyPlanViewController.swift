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
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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
