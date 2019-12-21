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

@images = [
  "https://vitamintalent.com/blog/img/2012/MySpace.png",
  "https://i.pinimg.com/originals/53/01/77/530177114ffc8db7bb959b3bd40172c9.jpg",
  "https://colorlib.com/wp/wp-content/uploads/sites/2/10_beauty-salon-websites.jpg",
  "https://www.businessassistcanada.com/wp-content/uploads/2014/11/beyond-sound-website1.jpg",
  "https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_HyperLightDrifterSpecialEdition_esES_image1600w.jpg",
  "https://uswfoxtail.blob.core.windows.net/foxtail-prod-uploads/images/Thinks.8dd35e85.fill-1366x700.format-jpeg.jpegquality-80.jpg",
  "https://www.imtonline.com/wp-content/themes/astra/assets/landing-page/images/banner_img.jpg",
  "https://i.pinimg.com/originals/d9/86/d9/d986d9937c9a4f44e9839d61b5c96989.jpg",
  "https://static.wixstatic.com/media/d6aa0f_add556a74676410e9be594138ed10e0c~mv2.jpg",
  "https://wearefram.com/wp-content/uploads/2019/11/The-quick-grasp-of-mobile-app-development-in-2019-and-trend-in-2020.png"
]

@users = [
  "https://i2-prod.mirror.co.uk/incoming/article14334083.ece/ALTERNATES/s615/3_Beautiful-girl-with-a-gentle-smile.jpg",
  "https://kottke.org/plus/misc/images/ai-faces-01.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm_GPnUjJp7i2PQBetTpGclRCyDhaycc-b8z29WMxUU8SkA6sA&s",
  "https://www.i-guridi.com/wp-content/uploads/2019/09/srlk-faces-2.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSweGwteXLgVKI8hUDaBk98B83fS88KMmYLYFzRYpdtNANm3eAz&s",
  "https://cdn-01.independent.ie/entertainment/movies/article38730750.ece/942a9/AUTOCROP/w620/ipanews_c1dbe7a3-ea8c-49b6-a49d-87f0b4297063_1",
  "https://pbs.twimg.com/profile_images/1060954783396384768/TFJgGy_1_400x400.jpg",
  "https://booker-theface.s3.amazonaws.com/library/1156/20191119_154528477.jpg",
  "https://storage.googleapis.com/faces_v1/faces/i3jgmzcl2xzku.jpg",
  "https://media.cnnchile.com/sites/2/2019/08/cnn-pew-die.jpg",
]

@courses = ["Desarrollo Full Stack", "Desarrollo Front End", "Data Science", "Diseño UX/UI", "Desarrollo Sitios Web", "Marketing Digital", "Desarrollo Videojuegos", "Desarrollo Android", "Desarrollo Videojuegos", "Desarrollo Android"]
@tags = ["Python", "Django", "Java", "Javascript", "Ruby", "Rails", "PHP", "Laravel", "Symfony", "Wordpress"]
@cities = ["Córdoba", "Santiago", "Valparaíso"]

admin = User.create(name: "admin", email:"admin@admin", password: "123123", avatar: File.open("app/assets/images/profile.png"), city: @cities.sample, course: @courses[0])
admin.add_role :admin

# u = User.create(name: "asd", email:"asd@asd", password: "123123", avatar: File.open("app/assets/images/profile.png"), city: "city", course: "@courses[i]")
# p = Project.create(user: u, name: "project asd", remote_project_photo_url: "https://cdn.dribbble.com/users/1991539/screenshots/9106913/media/94b8d7404d12d3b9ab2269a2da5e2d70.png", url: "www.google.com", repository: "www.google.com", lead: "lorem ipsum", description: "lorem ipsum")


10.times do |i|

  u = User.create(name: "User#{i}", email:"email#{i}@email.com", password: "123123", remote_avatar_url: @users[i], city: @cities.sample, course: @courses[i])
  p = Project.create(user: u, name: "Project#{i}", remote_project_photo_url: @images[i] , url: "www.google.com", repository: "www.google.com", lead: "lorem ipsum", description: "lorem ipsum")
  p.categories << Category.new(name: @tags[i])
  11.times do |j|
    c = p.comments.build(content: "Lorem #{j} del proyecto #{i}", user: u, project: p)
    c.save
  end

end
