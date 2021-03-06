# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create!(title: 'California Approves Statewide Rent Control', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc. Egestas sed sed risus pretium quam. Cras adipiscing enim eu turpis. Purus faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Lobortis mattis aliquam faucibus purus in massa. Vel eros donec ac odio tempor orci dapibus ultrices. Cursus euismod quis viverra nibh cras pulvinar mattis. Scelerisque varius morbi enim nunc. Diam ut venenatis tellus in metus vulputate eu. Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula.')
Post.create!(title: 'Water found on a potentially life-friendly alien planet', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc. Egestas sed sed risus pretium quam. Cras adipiscing enim eu turpis. Purus faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Lobortis mattis aliquam faucibus purus in massa. Vel eros donec ac odio tempor orci dapibus ultrices. Cursus euismod quis viverra nibh cras pulvinar mattis. Scelerisque varius morbi enim nunc. Diam ut venenatis tellus in metus vulputate eu. Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula.')
Post.create!(title: 'Ban children from gambling in games, MPs say', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc. Egestas sed sed risus pretium quam. Cras adipiscing enim eu turpis. Purus faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Lobortis mattis aliquam faucibus purus in massa. Vel eros donec ac odio tempor orci dapibus ultrices. Cursus euismod quis viverra nibh cras pulvinar mattis. Scelerisque varius morbi enim nunc. Diam ut venenatis tellus in metus vulputate eu. Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula.')
post = Post.create!(title: 'Rock Pi X Intel Cherry Trail Board', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc. Egestas sed sed risus pretium quam. Cras adipiscing enim eu turpis. Purus faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Lobortis mattis aliquam faucibus purus in massa. Vel eros donec ac odio tempor orci dapibus ultrices. Cursus euismod quis viverra nibh cras pulvinar mattis. Scelerisque varius morbi enim nunc. Diam ut venenatis tellus in metus vulputate eu. Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula.')

post.comments.create!(body: 'bananas')
c1 = post.comments.create!(body: 'kiwis')
c1.comments.create!(body: 'what is a kiwi?')
c2 = c1.comments.create!(body: 'apples are better')
c2.comments.create!(body: 'not sure about that')
post.comments.create!(body: 'apples')
post.comments.create!(body: 'pears')
post.comments.create!(body: 'carrots')
