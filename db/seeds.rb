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
Company.create!(name: "Pepsi", description: "Competencia de cocacola", area: "Bebestibles", web: "pepsi.cl", email: "contacto@pepsi.cl", country: 0, size: 10000)
Company.create!(name: "Amazon", description: "Hola Alexa", area: "Tecnologia", web: "amazon.com", email: "contact@amazon.com", country: 1, size: 100000)
Company.create!(name: "Google", description: "Ok, Google", area: "Tecnologia", web: "google.cl", email: "contact@google.com", country: 1, size: 100000)
Company.create!(name: "Uber", description: "Es mejor cabify", area: "Transporte", web: "uber.cl", email: "contacto@uber.cl", country: 0, size: 10000)

# Crear people
Person.create!(name: "Felipe", last_name: "Salgado", born_date: Date.new(1990, 1, 1), phone: "911111111", url: "felipe.cl", email: "felipe@gmail.com")
Person.create!(name: "Jorge", last_name: "Garay", born_date: Date.new(1990, 1, 1), phone: "922222222", url: "jorge.cl", email: "jorge@gmail.com")
Person.create!(name: "César", last_name: "Encina", born_date: Date.new(1990, 1, 1), phone: "933333333", url: "cesar.cl", email: "cesar@gmail.com")
Person.create!(name: "Mauro", last_name: "Gonzalez", born_date: Date.new(1990, 1, 1), phone: "944444444", url: "mauro.cl", email: "mauro@gmail.com")
Person.create!(name: "Persona1", last_name: "Apellido1", born_date: Date.new(1990, 1, 1), phone: "955555555", url: "pers1.cl", email: "correo1@gmail.com")
Person.create!(name: "Persona2", last_name: "Apellido2", born_date: Date.new(1989, 1, 1), phone: "966666666", url: "pers2.cl", email: "correo2@gmail.com")
Person.create!(name: "Persona3", last_name: "Apellido3", born_date: Date.new(1988, 1, 1), phone: "977777777", url: "pers3.cl", email: "correo3@gmail.com")
Person.create!(name: "Persona4", last_name: "Apellido4", born_date: Date.new(1987, 1, 1), phone: "988888888", url: "pers4.cl", email: "correo4@gmail.com")
Person.create!(name: "Persona5", last_name: "Apellido5", born_date: Date.new(1986, 1, 1), phone: "999999999", url: "pers5.cl", email: "correo5@gmail.com")
Person.create!(name: "Persona6", last_name: "Apellido6", born_date: Date.new(1997, 1, 1), phone: "911111112", url: "pers6.cl", email: "correo6@gmail.com")
Person.create!(name: "Persona7", last_name: "Apellido7", born_date: Date.new(1988, 1, 1), phone: "922222223", url: "pers7.cl", email: "correo7@gmail.com")
Person.create!(name: "Persona8", last_name: "Apellido8", born_date: Date.new(1989, 1, 1), phone: "933333334", url: "pers8.cl", email: "correo8@gmail.com")
Person.create!(name: "Persona9", last_name: "Apellido9", born_date: Date.new(1980, 1, 1), phone: "944444445", url: "pers9.cl", email: "correo9@gmail.com")
Person.create!(name: "Persona10", last_name: "Apellido10", born_date: Date.new(1981, 1, 1), phone: "955555556", url: "pers10.cl", email: "correo10@gmail.com")

# Crear jobs
Job.create!(role: "Practicante", company_id: 1, person_id: 1, start_date: Date.new(2020, 1, 1))
Job.create!(role: "Desarrollador", company_id: 1, person_id:2, start_date: Date.new(2018, 1, 1), end_date: Date.new(2019, 1, 1))
Job.create!(role: "Desarrollador", company_id: 2, person_id:2, start_date: Date.new(2019, 1, 10))
Job.create!(role: "Practicante", company_id: 2, person_id:4, start_date: Date.new(2020, 1, 1))
Job.create!(role: "Desarrollador", company_id: 1, person_id:3, start_date: Date.new(2018, 1, 1))
Job.create!(role: "Trabajo1", company_id: 3, person_id:5, start_date: Date.new(2018, 1, 1), end_date: Date.new(2019, 1, 1))
Job.create!(role: "Trabajo2", company_id: 4, person_id:6, start_date: Date.new(2018, 1, 1))
Job.create!(role: "Trabajo3", company_id: 5, person_id:7, start_date: Date.new(2018, 1, 1), end_date: Date.new(2019, 1, 1))
Job.create!(role: "Trabajo4", company_id: 6, person_id:8, start_date: Date.new(2018, 1, 1), end_date: Date.new(2019, 1, 1))
Job.create!(role: "Trabajo5", company_id: 3, person_id:9, start_date: Date.new(2018, 1, 1))
Job.create!(role: "Trabajo6", company_id: 4, person_id:10, start_date: Date.new(2018, 1, 1), end_date: Date.new(2019, 1, 1))
Job.create!(role: "Trabajo7", company_id: 5, person_id:11, start_date: Date.new(2018, 1, 1), end_date: Date.new(2019, 1, 1))
Job.create!(role: "Trabajo8", company_id: 6, person_id:12, start_date: Date.new(2018, 1, 1))
Job.create!(role: "Trabajo9", company_id: 1, person_id:13, start_date: Date.new(2018, 1, 1), end_date: Date.new(2019, 1, 1))
Job.create!(role: "Trabajo10", company_id: 3, person_id:14, start_date: Date.new(2018, 1, 1))
Job.create!(role: "Trabajo11", company_id: 5, person_id:5, start_date: Date.new(2019, 1, 10))
Job.create!(role: "Trabajo12", company_id: 4, person_id:7, start_date: Date.new(2018, 1, 11))
Job.create!(role: "Trabajo13", company_id: 1, person_id:11, start_date: Date.new(2018, 1, 12))
Job.create!(role: "Trabajo14", company_id: 3, person_id:13, start_date: Date.new(2018, 1, 13))
Job.create!(role: "Trabajo15", company_id: 5, person_id:8, start_date: Date.new(2018, 1, 14))
Job.create!(role: "Trabajo16", company_id: 4, person_id:10, start_date: Date.new(2018, 1, 15))

