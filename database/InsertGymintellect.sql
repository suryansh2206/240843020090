use p21_gymintellect;

INSERT INTO Role (rid, role_name, description)
VALUES
(1, 'ADMIN', 'System administrator'),
(2, 'GYM_OWNER', 'Owner of a gym'),
(3, 'MEMBER', 'Gym member');

INSERT INTO User (user_id, username, email, password, contact, rid, aadhar)
VALUES
(1, 'AdminUser', 'admin@example.com', 'admin123', '1234567890', 1, '123456789012'),
(2, 'GymOwner1', 'gymowner1@example.com', 'gym123', '9876543210', 2, '234567890123'),
(3, 'Member1', 'member1@example.com', 'member123', '5678901234', 3, '345678901234'),
(4, 'AdminA1', 'admina1@example.com', 'admina123', '1112223333', 1, '123123123123'),
(5, 'GymOwner2', 'gymowner2@example.com', 'gymowner2123', '9998887777', 2, '456789012345'),
(6, 'Member2', 'member2@example.com', 'member2123', '4445556666', 3, '567890123456');

INSERT INTO Gym_Profile (gym_profile_id, gym_name, location, contact, open_hours, gst, user_id, status)
VALUES
(1, 'Fitness Hub', 'New York', '1231231234', '6 AM - 10 PM', 'GST12345', 2, 'APPROVED'),
(2, 'Power Gym', 'Los Angeles', '9879879876', '5 AM - 11 PM', 'GST67890', 5, 'PENDING');

INSERT INTO Workout (workout_id, exercise_name, sets, reps, duration, rest_time)
VALUES
(1, 'Push-ups', 3, 15, '00:10:00', '00:01:00'),
(2, 'Squats', 4, 12, '00:15:00', '00:02:00'),
(3, 'Deadlift', 5, 8, '00:20:00', '00:03:00');


INSERT INTO Workout_Plan (plan_id, plan_name, duration, description)
VALUES
(1, 'Weight Loss Plan', '3 Months', 'Focus on cardio and calorie burning'),
(2, 'Strength Training', '6 Months', 'Focus on building strength and endurance');

INSERT INTO Member_Plan_Join (membership_id, start_date, end_date, status)
VALUES
(1, '2025-01-01', '2025-03-31', 'ACTIVE'),
(2, '2025-01-15', '2025-04-15', 'ACTIVE');

INSERT INTO Member (member_id, dob, gender, address, membership_id, user_id, height, plan_id, gym_profile_id)
VALUES
(1, '1990-01-01', 'Male', '123 Main St', 1, 3, 175, 1, 1),
(2, '1995-05-15', 'Female', '456 Elm St', 2, 6, 160, 2, 2);

INSERT INTO Notification (notification_id, notification_type, member_id, message, status)
VALUES
(1, 'Welcome', 1, 'Welcome to Fitness Hub!', 'Sent'),
(2, 'Plan Reminder', 2, 'Your plan expires soon!', 'Pending');

INSERT INTO Progress (progress_id, date, calorie_burnt, bmi, weight, member_id)
VALUES
(1, '2025-01-01', 500, 24.5, 70, 1),
(2, '2025-01-02', 600, 22.0, 60, 2);

INSERT INTO Diet_Plan (diet_id, workoutPlan_id, meal_type, description, calories)
VALUES
(1, 1, 'Breakfast', 'Oatmeal and fruits', 300),
(2, 2, 'Lunch', 'Grilled chicken and veggies', 500);

INSERT INTO Diet_Plan_Type (dietPlan_name, description)
VALUES
('Weight Loss', 'Low-calorie meals for weight loss'),
('Muscle Gain', 'High-protein meals for muscle building');

INSERT INTO Workout_Join (woj_id, workout_id, plan_id)
VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO Membership_Plan (member_plan_id, plan_name, duration, price, gym_profile_id)
VALUES
(1, 'Basic Plan', '3 Months', '1000', 1),
(2, 'Premium Plan', '6 Months', '2000', 2);
