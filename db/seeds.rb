# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelf.delete_all 
Book.delete_all
Author.delete_all
Publisher.delete_all
authors= Author.create([
    {name: 'Charles Dickens'},
    {name: 'Walter Isaacson'},
])

publications=Publisher.create([
    {name: 'Simon & Schuster'},
    {name: 'Penguin Classics'}
])

books=Book.create([
    {title: "Oliver Twist",isbn: '978-0141439747', author: authors.first, publisher: publications.last},
    {title: 'Great Expectations', isbn: '978-0141439563', author: authors.first, publisher: publications.last},{
        title: 'A tale of two cities', isbn:'978-0141439563', author: authors.first, publisher: publications.last
    },{
      title: 'Leonardo Da Vinci', isbn: '978-1471166761', author: authors.last, publisher: publications.first  
    },{
        title: 'Einstein: His Life and Universe', isbn: '978-1847390547', author: authors.last, publisher: publications.first
    },
    {title: 'Steve Jobs',isbn: '034914043X', author: authors.last, publisher: publications.first},
    {title: 'Benjamin Franklin',isbn: 'B000FBJG4U',author: authors.last, publisher: publications.first}
])