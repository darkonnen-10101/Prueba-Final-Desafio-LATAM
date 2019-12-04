# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.destroy_all
User.destroy_all

admin = User.create(name: "admin", email:"admin@admin", password: "123123", avatar: Rails.root.join("app/assets/images/profile.png").open, city: "Admin city", course: "Admin course")
admin.add_role :admin

10.times do |i|

  u = User.create(name: "User#{i}", email:"email#{i}@email.com", password: "123123", avatar: Rails.root.join("app/assets/images/profile.png").open, city: "city#{i}", course: "Course#{i}")
  p = Project.create(user: u, name: "Project#{i}", project_photo: Rails.root.join("app/assets/images/profile.png").open, url: "www.google.com", repository: "www.google.com", lead: "lorem ipsum", description: "lorem ipsum")

  11.times do |j|
    c = p.comments.build(content: "Lorem #{j} del proyecto #{i}", user: u, project: p)
    c.save
  end

end
