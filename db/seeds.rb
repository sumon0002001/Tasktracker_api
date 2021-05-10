user1 = User.create(username: 'sumon', password:'asdfgh')
user2 = User.create(username: 'rocky', password: '123456')

task1 = Task.create(user_id: 1, name: 'TakingBreakfast', description: 'Eating food')
task2 = Illness.create(user_id: 1, name: 'TakingShower' , description: 'Taking hot shower')

tracking1 = Tracking.create(task_id:1 ,date: "2020-06-11" , mood:'🙂', temperature: 36.5, medicines:["Omeprazol", "Peptobismol"], symptons:["Weakness", "Stomache"])
tracking2 = Tracking.create(illness_id: 1, date: "2020-06-10" , mood:'🙁', temperature: 36.7)