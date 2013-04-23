class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :tenant

  attr_accessible :name, :author_name, :published_at, :content, :tenant_id
  default_scope { where(tenant_id: Tenant.current_id) }
  
end
