class UsersController < ApplicationController
#  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  respond_to :html, :json
  load_and_authorize_resource 
  skip_authorize_resource :only => [:new, :create, :pending, :suspended, :active,
     :deleted, :sort_column, :sort_direction]

  def toggle_role
    @user = User.find(params[:id])
    role = Role.find_by_name(params[:role])
    if @user.roles.include?(role)
      @user.roles.delete(role)
      flash[:notice] = "Revoked #{role.name} permissions"
    else
      @user.roles << role
      @user.save
#      track_activity @user
      flash[:notice] = "Granted #{role.name} permissions"
    end
    if request.env["HTTP_REFERER"].present?
      redirect_to :back, only_path: true 
    else
      redirect_to user_path(@user), only_path: true 
    end
  end

  def pending
      @users = User.paginate :conditions => {:state => 'pending'}, :page => params[:page], :per_page => 20
    render :action => 'index'
  end

  def suspended
      @users = User.paginate :conditions => {:state => 'suspended'}, :page => params[:page], :per_page => 20
    render :action => 'index'
  end
  
  def active
      @users = User.paginate :conditions => {:state => 'active'}, :page => params[:page], :per_page => 20
    render :action => 'index'
  end
  
  def deleted
      @users = User.paginate :conditions => {:state => 'deleted'}, :page => params[:page], :per_page => 20
    render :action => 'index'
  end
  
  def activate
    @user = User.find(params[:id])
    @user.activate!
 #     track_activity @user
    redirect_to users_path, only_path: true 
  end
  
  def suspend
    @user = User.find(params[:id])
    @user.suspend! 
#      track_activity @user
    redirect_to users_path, only_path: true 
  end

  def unsuspend
    @user = User.find(params[:id])
    @user.unsuspend! 
#      track_activity @user
    redirect_to users_path, only_path: true
  end

  def purge
    @user = User.find(params[:id])
    @user.destroy
 #     track_activity @user
    redirect_to users_url, only_path: true
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, notice: "Updated profile."
    else
      render "new"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end



end
