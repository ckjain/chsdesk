class TenantImportsController < ApplicationController
  def new
    @tenant_import = TenantImport.new
  end

  def create
    @tenant_import = TenantImport.new(params[:tenant_import])
    if @tenant_import.save
      redirect_to root_url, notice: "Imported tenants successfully."
    else
      render :new
    end
  end
end
