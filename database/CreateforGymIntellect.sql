create database p21_gymintellect;

use p21_gymintellect;

-- Role Table
CREATE TABLE Role (
    rid INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);

-- User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    contact VARCHAR(15) NOT NULL,
    rid INT,
    aadhar VARCHAR(12) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME ON UPDATE CURRENT_TIMESTAMP,
    reset_token VARCHAR(255),
    token_expiration TIMESTAMP,
    FOREIGN KEY (rid) REFERENCES Role(rid)
);

-- Gym Profile Table
CREATE TABLE Gym_Profile (
    gym_profile_id INT PRIMARY KEY AUTO_INCREMENT,
    gym_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    contact VARCHAR(15) NOT NULL,
    open_hours VARCHAR(50),
    gst VARCHAR(255) NOT NULL,
    user_id INT,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Workout Table
CREATE TABLE Workout (
    workout_id INT PRIMARY KEY AUTO_INCREMENT,
    exercise_name VARCHAR(255) NOT NULL,
    sets INT NOT NULL,
    reps INT NOT NULL,
    duration TIME NOT NULL,
    rest_time TIME NOT NULL
);

-- Workout Plan Table
CREATE TABLE Workout_Plan (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(50) NOT NULL,
    duration VARCHAR(50) NOT NULL,
    description TEXT NOT NULL
);

-- Membership Plan Table
CREATE TABLE Membership_Plan (
    member_plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(255) NOT NULL,
    duration VARCHAR(100) NOT NULL,
    price VARCHAR(100) NOT NULL,
    gym_profile_id INT,
    FOREIGN KEY (gym_profile_id) REFERENCES Gym_Profile(gym_profile_id)
);

-- Member Plan Join Table
CREATE TABLE Member_Plan_Join (
    membership_id INT PRIMARY KEY AUTO_INCREMENT,
    member_plan_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (member_plan_id) REFERENCES Membership_Plan(member_plan_id)
);

-- Member Table
CREATE TABLE Member (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    dob DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    address VARCHAR(255),
    membership_id INT,
    user_id INT,
    height INT NOT NULL,
    plan_id INT,
    gym_profile_id INT,
    FOREIGN KEY (membership_id) REFERENCES Member_Plan_Join(membership_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (plan_id) REFERENCES Workout_Plan(plan_id),
    FOREIGN KEY (gym_profile_id) REFERENCES Gym_Profile(gym_profile_id)
);

-- Notification Table
CREATE TABLE Notification (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    notification_type VARCHAR(50) NOT NULL,
    member_id INT,
    message TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

-- Progress Table
CREATE TABLE Progress (
    progress_id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    calorie_burnt FLOAT NOT NULL,
    bmi FLOAT NOT NULL,
    weight FLOAT NOT NULL,
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

-- Diet Plan Table
CREATE TABLE Diet_Plan (
    diet_id INT PRIMARY KEY AUTO_INCREMENT,
    workoutPlan_id INT,
    meal_type VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    calories FLOAT NOT NULL,
    FOREIGN KEY (workoutPlan_id) REFERENCES Workout_Plan(plan_id)
);

-- Diet Plan Type Table
CREATE TABLE Diet_Plan_Type (
    dietPlan_name VARCHAR(50) PRIMARY KEY,
    description TEXT NOT NULL
);

-- Workout Join Table
CREATE TABLE Workout_Join (
    woj_id INT PRIMARY KEY AUTO_INCREMENT,
    workout_id INT,
    plan_id INT,
    FOREIGN KEY (workout_id) REFERENCES Workout(workout_id),
    FOREIGN KEY (plan_id) REFERENCES Workout_Plan(plan_id)
);
