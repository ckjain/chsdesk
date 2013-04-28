superman = Article.create! name: "Superman", author_name: "Clark Kent", published_at: 1.weeks.ago, content: "Superman is a fictional comic book superhero appearing in publications by DC Comics, widely considered to be an American cultural icon. Created by American writer Jerry Siegel and Canadian-born American artist Joe Shuster in 1932 while both were living in Cleveland, Ohio, and sold to Detective Comics, Inc. (later DC Comics) in 1938, the character first appeared in Action Comics #1 (June 1938) and subsequently appeared in various radio serials, television programs, films, newspaper strips, and video games. (from Wikipedia)"
krypton = Article.create! name: "Krypton", author_name: "Clark Kent", published_at: 4.weeks.ago, content: "Krypton is a fictional planet in the DC Comics universe, and the native world of the super-heroes Superman and, in some tellings, Supergirl and Krypto the Superdog. Krypton has been portrayed consistently as having been destroyed just after Superman's flight from the planet, with exact details of its destruction varying by time period, writers and franchise. Kryptonians were the dominant people of Krypton. (from Wikipedia)"
batman = Article.create! name: "Batman & Robin", author_name: "Bruce Wayne", published_at: 2.weeks.ago, content: "Batman is a fictional character created by the artist Bob Kane and writer Bill Finger. A comic book superhero, Batman first appeared in Detective Comics #27 (May 1939), and since then has appeared primarily in publications by DC Comics. Originally referred to as The Bat-Man and still referred to at times as The Batman, he is additionally known as The Caped Crusader, The Dark Knight, and the World's Greatest Detective, among other titles. (from Wikipedia)"

Article.create! name: "Wonder Woman", author_name: "Diana of Themyscira", published_at: 6.weeks.ago, content: "Wonder Woman is a DC Comics superheroine created by William Moulton Marston. She first appeared in All Star Comics #8 (December 1941). The Wonder Woman title has been published by DC Comics almost continuously except for a brief hiatus in 1986. (from Wikipedia)"
Article.create! name: "Flash", author_name: "Bart Allen", published_at: 5.weeks.ago, content: "The Flash is a name shared by several fictional comic book superheroes from the DC Comics universe. Created by writer Gardner Fox and artist Harry Lampert, the original Flash first appeared in Flash Comics #1 (January 1940). (from Wikipedia)"
Article.create! name: "Splinter", author_name: "Hamato Yoshi", published_at: 3.weeks.ago, content: "Master Splinter, or simply Splinter, is a fictional character from the Teenage Mutant Ninja Turtles comics and all related media. (from Wikipedia)"


puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

tenant1 = Tenant.create! :name => 'Samarth Aangan CHS', :subdomain => 'sa', :number_of_flats => 330, :active => true, :society_address_line1 => 'Lokhandwala Complex, K.L.walawalkar road', :society_address_line2 => 'Andheri West', :society_pincode => '400053'
  puts 'SA created: ' << tenant1.name
  user2 = User.create! :name => 'SAadmin', :state => 'active', :email => 'sa_admin@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 1
  puts 'New user created: ' << user2.name
  user2.add_role :admin
  user3 = User.create! :name => 'SAaccountant', :email => 'sa_accountant@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 1
  puts 'New user created: ' << user3.name
  user3.add_role :accountant
  user4 = User.create! :name => 'SAcommittee', :email => 'sa_committee@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 1
  puts 'New user created: ' << user4.name
  user4.add_role :committee
  user5 = User.create! :name => 'SAmanager', :email => 'sa_manager@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 1
  puts 'New user created: ' << user5.name
  user5.add_role :manager
  user6 = User.create! :name => 'SAmember', :email => 'sa_member@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 1
  puts 'New user created: ' << user6.name
  user6.add_role :member
  user22 = User.create! :name => 'SAevent', :email => 'sa_event@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 1
  puts 'New user created: ' << user22.name
  user22.add_role :event
  user23 = User.create! :name => 'SAmeeting', :email => 'sa_meeting@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 1
  puts 'New user created: ' << user23.name
  user23.add_role :meeting

tenant2 = Tenant.create! :name => 'Oshiwara ind. Center', :subdomain => 'oic', :number_of_flats => 270, :active => true, :society_address_line1 => 'Link Road Opp Oshiwara Bus depo', :society_address_line2 => 'Goregaon West', :society_pincode => '400104'
  puts 'oic created: ' << tenant2.name
  user13 = User.create! :name => 'OICadmin', :state => 'active', :email => 'OIC_admin@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 2
  puts 'New user created: ' << user13.name
  user13.add_role :admin
  user14 = User.create! :name => 'OICaccountant', :email => 'OIC_accountant@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 2
  puts 'New user created: ' << user14.name
  user14.add_role :accountant
  user15 = User.create! :name => 'OICcommittee', :email => 'OIC_committee@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 2
  puts 'New user created: ' << user15.name
  user15.add_role :committee
  user16 = User.create! :name => 'OICmanager', :email => 'OIC_manager@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 2
  puts 'New user created: ' << user16.name
  user16.add_role :manager
  user7 = User.create! :name => 'OICmember', :email => 'OIC_member@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 2
  puts 'New user created: ' << user7.name
  user7.add_role :member
  user20 = User.create! :name => 'OICevent', :email => 'OIC_event@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 2
  puts 'New user created: ' << user20.name
  user20.add_role :event
  user21 = User.create! :name => 'OICmeeting', :email => 'OIC_meeting@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 2
  puts 'New user created: ' << user21.name
  user21.add_role :meeting

tenant3 = Tenant.create! :name => 'BRIGHOTN TOWER CHS', :subdomain => 'bt', :society_address_line1 => '2ND CROSS LANE',:society_address_line2 => 'ANDHERI (W)', :society_city => 'MUMBAI',:society_pincode => '400053', :active => true, :number_of_flats => 1, :active => true, :number_of_flats => 120
  puts 'BT created: ' << tenant3.name
  user8 = User.create! :name => 'BTadmin', :state => 'active', :email => 'BT_admin@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 3
  puts 'New user created: ' << user8.name
  user8.add_role :admin
  user9 = User.create! :name => 'BTaccountant', :email => 'BT_accountant@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 3
  puts 'New user created: ' << user9.name
  user9.add_role :accountant
  user10 = User.create! :name => 'BTcommittee', :email => 'BT_committee@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 3
  puts 'New user created: ' << user10.name
  user10.add_role :committee
  user11 = User.create! :name => 'BTmanager', :email => 'BT_manager@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 3
  puts 'New user created: ' << user11.name
  user11.add_role :manager
  user12 = User.create! :name => 'BTmember', :email => 'BT_member@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 3
  puts 'New user created: ' << user12.name
  user12.add_role :member
  user18 = User.create! :name => 'BTevent', :email => 'BT_event@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 3
  puts 'New user created: ' << user18.name
  user18.add_role :event
  user19 = User.create! :name => 'BTmeeting', :email => 'BT_meeting@chsdesk.com', :password => 'changeme', :password_confirmation => 'changeme', :tenant_id => 3
  puts 'New user created: ' << user19.name
  user19.add_role :meeting
