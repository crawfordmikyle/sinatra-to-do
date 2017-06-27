user1args = {:email => "test1@test.com", :firstname => "user1", :lastname =>"user_l1", :password => "password"}
user2args = {:email => "test2@test.com", :firstname => "user2", :lastname =>"user_l2", :password => "rockandroll"}
user3args = {:email => "test3@test.com", :firstname => "user3", :lastname =>"user_l3", :password => "rubyrocks"}
user4args = {:email => "test4@test.com", :firstname => "user4", :lastname =>"user_l4", :password => "code4days"}

users = [user1args,user2args,user3args,user4args]

users.each do |args|
	User.create(args)
end 

 
task1args = {:title => "Task 1 For User 1", :content => "Test Task 1", :due_date => "2017-06-27", :user_id => 1}
task2args = {:title => "Task 1 For User 2", :content => "Test Task 2", :due_date => "2017-06-27", :user_id => 2}
task3args = {:title => "Task 2 For User 1", :content => "Test Task 3", :due_date => "2017-06-27", :user_id => 1}
task4args = {:title => "Task 1 For User 4", :content => "Test Task 4", :due_date => "2017-06-27", :user_id => 4}
task5args = {:title => "Task 1 For User 3", :content => "Test Task 5", :due_date => "2017-06-27", :user_id => 3}
task6args = {:title => "Task 3 For User 1", :content => "Test Task 6", :due_date => "2017-06-27", :user_id => 1}
task7args = {:title => "Task 2 For User 3", :content => "Test Task 7", :due_date => "2017-06-27", :user_id => 3}

tasks = [task1args,task2args,task3args,task4args,task5args,task6args,task7args]

tasks.each do |args|
	Task.create(args)
end