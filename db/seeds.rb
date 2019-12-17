# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.destroy_all
User.destroy_all
Category.destroy_all

@courses = ["Desarrollo Full Stack", "Desarrollo Front End", "Data Science", "Diseño UX/UI", "Desarrollo Sitios Web", "Marketing Digital", "Desarrollo Videojuegos", "Desarrollo Android", "Desarrollo Videojuegos", "Desarrollo Android"]
@tags = ["Python", "Django", "Java", "Javascript", "Ruby", "Rails", "PHP", "Laravel", "Symfony", "Wordpress"]

admin = User.create(name: "admin", email:"admin@admin", password: "123123", avatar: File.open("app/assets/images/profile.png"), city: "Admin city", course: @courses[0])
admin.add_role :admin

10.times do |i|

  u = User.create(name: "User#{i}", email:"email#{i}@email.com", password: "123123", avatar: File.open("app/assets/images/profile.png"), city: "city#{i}", course: @courses[i])
  p = Project.create(user: u, name: "Project#{i}", project_photo: File.open("app/assets/images/profile.png"), url: "www.google.com", repository: "www.google.com", lead: "lorem ipsum", description: "lorem ipsum")
  p.categories << Category.new(name: @tags[i])
  11.times do |j|
    c = p.comments.build(content: "Lorem #{j} del proyecto #{i}", user: u, project: p)
    c.save
  end

end
