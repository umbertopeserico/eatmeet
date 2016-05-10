# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

zone = Zone.create(name: 'Zona 1')
restaurant_owner = RestaurantOwner.create(name:'Ristoratore',
                                          surname: '1',
                                          email: 'umberto@peserico.me',
                                          password:'ristoratore1',
                                          password_confirmation:'ristoratore1')
restaurant_owner.confirm!

restaurant = Restaurant.create(name: 'Ristorante 1',
                               description: 'Descrizione ristorante',
                               email: 'umberto@peserico.me',
                               phone: '0445401245',
                               street: 'Via Prova 10',
                               city: 'Trento',
                               zip_code: '38121',
                               province: 'Trento',
                               restaurant_owner_id: restaurant_owner.id)
restaurant.zones << zone