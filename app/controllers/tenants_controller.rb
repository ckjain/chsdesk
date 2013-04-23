class TenantsController < ApplicationController


  def index
    @tenants = Tenant.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @tenants.to_csv }
      format.xls # { send_data @tenants.to_csv(col_sep: "\t") }
    end
  end
  
end