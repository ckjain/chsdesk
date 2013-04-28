class Tenant < ActiveRecord::Base
    attr_accessible :name ,:subdomain, :number_of_flats, :active,  :society_address_line1, 
    :society_address_line2, :society_city, :society_pincode, :society_state, :society_country,
    :govt_address_line1, :govt_address_line2, :govt_address_city, :govt_address_pincode,
    :govt_address_plotnumber, :registration_number, :govt_ward_number

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

  def society_name
    "#{name.capitalize}"
  end

end