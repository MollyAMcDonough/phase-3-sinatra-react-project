puts "Clearing db..."
Category.destroy_all
Priority.destroy_all
TaskDef.destroy_all
TaskTime.destroy_all

puts "🌱 Seeding tables..."

puts "Seeding categories..."
Category.create(name: "Focused work")
Category.create(name: "Being a human")
Category.create(name: "Outdoor activity")
Category.create(name: "Hobby")
Category.create(name: "Socializing")
Category.create(name: "Learning")
Category.create(name: "Physical activity")

puts "Seeding priorities..."
Priority.create(value: 1, description: "Urgent")
Priority.create(value: 2, description: "High")
Priority.create(value: 3, description: "Medium")
Priority.create(value: 4, description: "Low")
Priority.create(value: 5, description: "Optional")

puts "Seeding task defs and times..."
10.times do |i|
    td = TaskDef.create(category: Category.all.sample, priority: Priority.all.sample, title: Faker::Company.bs, description: Faker::ChuckNorris.fact)
    times = [Faker::Time.between(from: Date.today+i-5,to: Date.today+i-4), Faker::Time.between(from: Date.today+i-5,to: Date.today+i-4)]
    TaskTime.create(task_def: td, startDate: times.min, endDate: times.max)
end

puts "✅ Done seeding!"
