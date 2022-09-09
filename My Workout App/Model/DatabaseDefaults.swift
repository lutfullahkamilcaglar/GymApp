//
//  Database.swift
//  My Workout App
//
//  Created by Kamil Caglar on 08/09/2022.
//

import Foundation


let legExcercises: [ExcerciseModel] = [
    ExcerciseModel(
        title: "Leg Press",
        image: "legpress"
    ),
    ExcerciseModel(
        title: "Seated Leg Extension",
        image: "legpress"
    ),
    ExcerciseModel(
        title: "Seated Hamstring Curl",
        image: "legpress"
    ),
    ExcerciseModel(
        title: "Calf Raises",
        image: "legpress"
    )
]

let trapExercises: [ExcerciseModel] = [
    ExcerciseModel(
        title: "Traps",
        image: "  "),
    ExcerciseModel(
        title: "Dumbell Shrug",
        image: " "),
    ExcerciseModel(
        title: "Upright Row",
        image: " ")
    
]

let backExercises: [ExcerciseModel] = [
    ExcerciseModel(
        title: "Pull-up",
        image: " "),
    ExcerciseModel(
        title: "Seated row",
        image: " "),
    ExcerciseModel(
        title: "Bent-over row",
        image: " "),
    ExcerciseModel(
        title: "Wide-grip Lat Pull-down",
        image: " ")
    
]

let shoulderExcercises: [ExcerciseModel] = [
    ExcerciseModel(
        title: "Overhead Press",
        image: "legpress"
    ),
    ExcerciseModel(
        title: "Seated Lateral Raise",
        image: "legpress"
    ),
    ExcerciseModel(
        title: "Bent-over Reverse Flye",
        image: "legpress"
    ),
    ExcerciseModel(
        title: "Seated Arnold Press",
        image: "legpress"
    )
]

let tricepsExercises: [ExcerciseModel] = [
    ExcerciseModel(
        title: "Dips",
        image: ""),
    ExcerciseModel(
        title: "Close Grip Bench Press",
        image: " "),
    ExcerciseModel(
        title: "Pushdown",
        image: " "),
    ExcerciseModel(
        title: "Lying Triceps Extensions",
        image: " "),
    ExcerciseModel(
        title: "Dumbbell Kickback",
        image: " ")
    
]

let coreExercises: [ExcerciseModel] = [
    ExcerciseModel(
        title: "Dumbbell Crunch",
        image: "  "),
    ExcerciseModel(
        title: "Seated Russian Twist",
        image: " "),
    ExcerciseModel(
        title: "Pulse Up",
        image: " "),
    ExcerciseModel(
        title: "Hanging Leg Raises",
        image: " ")
]
 
let chestExercises: [ExcerciseModel] = [
    ExcerciseModel(
        title: "Bech Press",
        image: "  "),
    ExcerciseModel(
        title: "Incline Bench Press",
        image: " "),
    ExcerciseModel(
        title: "Decline Bench Press",
        image: " "),
    ExcerciseModel(
        title: "Incline Dumbbell Flye",
        image: " "),
    ExcerciseModel(
        title: "Cable Crossover",
        image: " ")
]

let bicepsExercises: [ExcerciseModel] = [
ExcerciseModel(
    title: "Dumbbell Curl",
    image: " "),
ExcerciseModel(
    title: "Hammer Curl",
    image: " "),
ExcerciseModel(
    title: "21's",
    image: " "),
]


let workouts: [WorkoutModel] = [
    WorkoutModel(
        title: "Leg Exercises",
        image: "legpress",
        excercises: legExcercises
    ),
    WorkoutModel(
        title: "Shoulder Exercises",
        image: "shoulderexercises",
        excercises: shoulderExcercises
    ),
    WorkoutModel(
        title: "Traps Exercises",
        image: "trapexercises",
        excercises: trapExercises
    ),
    WorkoutModel(
        title: "Triceps Exercises",
        image: "tricepsexercises",
        excercises: tricepsExercises
    ),
    WorkoutModel(
        title: "Biceps Exercises",
        image: "bicepsexercise", excercises: bicepsExercises
    ),
    WorkoutModel(
        title: "Back Exercises",
        image: "backexercises", excercises: backExercises
    ),
    WorkoutModel(
        title: "Chest Exercises",
        image: "chestexercises",
        excercises: chestExercises)
]



