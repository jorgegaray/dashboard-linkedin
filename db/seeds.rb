# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Crear companias
Company.create!(name: "Buk", description: "Queremos pizza!", area: "Recursos Humanos", web: "buk.cl", email: "contacto@buk.cl", country: 0, size: 100)
Company.create!(name: "CocaCola", description: "Queremos bebida!", area: "Bebestibles", web: "cocacola.cl", email: "contacto@cocacola.cl", country: 0, size: 10000)

# Crear people
Person.create!(name: "Felipe", last_name: "Salgado", born_date: Date.new(1990, 1, 1), phone: "911111111", url: "felipe.cl", email: "felipe@gmail.com")
Person.create!(name: "Jorge", last_name: "Garay", born_date: Date.new(1990, 1, 1), phone: "922222222", url: "jorge.cl", email: "jorge@gmail.com")
Person.create!(name: "César", last_name: "Encina", born_date: Date.new(1990, 1, 1), phone: "933333333", url: "cesar.cl", email: "cesar@gmail.com")
Person.create!(name: "Mauro", last_name: "Gonzalez", born_date: Date.new(1990, 1, 1), phone: "944444444", url: "mauro.cl", email: "mauro@gmail.com")

# Crear jobs
Job.create!(role: "Practicante", company_id: 1, person_id: 1, start_date: Date.new(2020, 1, 1))
Job.create!(role: "Desarrollador", company_id: 1, person_id:2, start_date: Date.new(2018, 1, 1), end_date: Date.new(2019, 1, 1))
Job.create!(role: "Desarrollador", company_id: 2, person_id:2, start_date: Date.new(2019, 1, 10))
Job.create!(role: "Practicante", company_id: 2, person_id:4, start_date: Date.new(2020, 1, 1))
Job.create!(role: "Desarrollador", company_id: 1, person_id:3, start_date: Date.new(2018, 1, 1))
