require 'aasm_roles'
class User < ActiveRecord::Base
  include AasmRoles
  rolify
  
  attr_accessible :name, :email, :password, :password_confirmation, :tenant_id, :auth_token, :state
  has_secure_password

  has_and_belongs_to_many :roles, :join_table => :users_roles
  has_many :activities

  has_many :articles, dependent: :destroy
  belongs_to :tenant

  before_save { email.downcase! }
  before_create { generate_token(:auth_token) }

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :name, scope: :tenant_id
  validates_uniqueness_of :email, scope: :tenant_id
  validates_presence_of :password, :on => :create,
                        length: { minimum: 6 }
#  validates :password_confirmation, presence: true
  default_scope { where(tenant_id: Tenant.current_id) }


  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

 #------------------------baeapp2
  def super_admin?
    has_role?(:super_admin)
  end

  def admin?
    has_role?(:admin)
  end
  
  def site_name
    self.name || self.email.split("@").first
  end

  def username
    User.name
  end
  
  def has_role?(role)
    role_symbols.include?(role.to_sym) || role_symbols.include?(:admin)
  end
  
  def has_real_role?(role)
    role_symbols.include?(role.to_sym)
  end
  
  def role_symbols
    @role_symbols ||= roles.map {|r| r.name.underscore.to_sym }
  end

#----------------------baseapp2 end-----

end
