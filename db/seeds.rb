# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:username => 'admin', :email => 'saad_ghouri75@yahoo.com', :password => 'admin123', :password_confirmation => 'admin123', :role => 'admin')

Province.create(:name => 'Ontario')
Province.create(:name => 'Quebec')

# Ontario cities
City.create(:name => 'Toronto', :province => 'ON')
City.create(:name => 'Ottawa', :province => 'ON')
City.create(:name => 'Mississauga', :province => 'ON')
City.create(:name => 'Perth', :province => 'ON')
City.create(:name => 'Prince Edward', :province => 'ON')
City.create(:name => 'Kingston', :province => 'ON')
City.create(:name => 'Burlington', :province => 'ON')
City.create(:name => 'Stratford', :province => 'ON')
City.create(:name => 'Thunder Bay', :province => 'ON')
# Quebec cities
City.create(:name => 'Montreal', :province => 'QC')
City.create(:name => 'Quebec City', :province => 'QC')
City.create(:name => 'Gatineau', :province => 'QC')
City.create(:name => 'Saguenay', :province => 'QC')
City.create(:name => 'Lévis', :province => 'QC')
City.create(:name => 'Trois-Rivières', :province => 'QC')
City.create(:name => 'Terrebonne', :province => 'QC')
City.create(:name => 'Mascouche', :province => 'QC')

Area.create(:name => 'Greater Montreal', :city => 'Montreal')
Area.create(:name => 'Downtown', :city => 'Montreal')
Area.create(:name => 'Laval', :city => 'Montreal')
Area.create(:name => 'Longueil', :city => 'Montreal')
Area.create(:name => 'Verdun', :city => 'Montreal')
Area.create(:name => "Nun's Island", :city => 'Montreal')