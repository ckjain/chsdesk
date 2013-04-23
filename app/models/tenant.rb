class Tenant < ActiveRecord::Base
  attr_accessible :name, :subdomain
    has_many :users
    has_many :articles
  
  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end
  
  def self.current_id
    Thread.current[:tenant_id]
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |tenant|
        csv << tenant.attributes.values_at(*column_names)
      end
    end
  end
  
end