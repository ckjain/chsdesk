
_____ sudo -u postgres createdb -O ckjain forum_development
___________________________________
rails_admin added in config (?)

user.rb---

  after_create :send_welcome_email (?)
  
  def send_welcome_email			(?)
    UserMailer.welcome_email(self).deliver
  end
-------------------------

Ability

if user.has_role? :admin  (super_admin)
      can :manage, :all
      
------------------------------
http://stackoverflow.com/questions/221385/ruby-on-rails-and-jeditable-jquery
http://www.tutorialspoint.com/ruby/ruby_object_oriented.htm

    Create a User using rails console

 user = User.new
 user.email = "anyemail@ddress.com"
 user.password = "test1234"> user.save

    Add a role to the new User

 user.add_role :admin

    Check if the user has admin rights

 ability = Ability.new(user)
 ability.can? :manage, :all
  => true
--------------------------------------------------

CSS properties used for background effects:

background-color
background-image
background-repeat
background-attachment
background-position

<a data-toggle="modal" href="#role-options-<%= user.id %>" class="btn btn-mini" type="button">Change role</a>

1.9.3-p327 :001 >  y Rails.application.config.assets.paths
---
- /home/ckjain/Documents/Aptana Studio 3 Workspace/chsdesk-v-1/app/assets/images
- /home/ckjain/Documents/Aptana Studio 3 Workspace/chsdesk-v-1/app/assets/img
- /home/ckjain/Documents/Aptana Studio 3 Workspace/chsdesk-v-1/app/assets/javascripts
- /home/ckjain/Documents/Aptana Studio 3 Workspace/chsdesk-v-1/app/assets/stylesheets
- /home/ckjain/Documents/Aptana Studio 3 Workspace/chsdesk-v-1/vendor/assets/javascripts
- /home/ckjain/Documents/Aptana Studio 3 Workspace/chsdesk-v-1/vendor/assets/stylesheets
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/best_in_place-1.1.2/lib/assets/javascripts
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/fullcalendar-rails-1.5.3.0/vendor/assets/javascripts
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/fullcalendar-rails-1.5.3.0/vendor/assets/stylesheets
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/jquery-rest-rails-1.0.0/vendor/assets/javascripts
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/client_side_validations-3.2.5/vendor/assets/javascripts
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/bootstrap-sass-2.0.3.1/vendor/assets/images
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/bootstrap-sass-2.0.3.1/vendor/assets/javascripts
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/bootstrap-sass-2.0.3.1/vendor/assets/stylesheets
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/jquery-rails-2.0.2/vendor/assets/javascripts
- /home/ckjain/.rvm/gems/ruby-1.9.3-p327/gems/coffee-rails-3.2.2/lib/assets/javascripts
 => nil 