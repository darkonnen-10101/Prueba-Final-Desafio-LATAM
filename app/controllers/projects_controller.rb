class ProjectsController < ApplicationController
  # before_action :set_project, only: [:all, :display, :add_category, :remove_category]
                                      # :show, :edit, :update, :destroy,
  # skip_before_action :verify_authenticity_token
  # load_and_authorize_resource
  # authorize_resource :only => [:add_category, :remove_category, :edit, :display, :show, :edit, :update, :destroy]
  #                             # , :all
  # load_resource

  before_action :authenticate_user!, only: [:new, :display]
  load_and_authorize_resource

  skip_authorize_resource :only => [:add_category, :remove_category] #, :all, :display
  skip_before_action :verify_authenticity_token, :only => [:create, :update]


  def index
    # @projects = Project.all
    @projects = Project.page(params[:page]).order(created_at: :desc).per(9)
  end

  def filter
    # @projects = Project.all.joins(:categories).where(:categories => {name: params[:value]}).page(params[:page]).order(created_at: :desc).per(9)
    @projects = Project.joins(:user).all.where(:users => {course: params[:value]}).page(params[:page]).order(created_at: :desc).per(9)

  end


  def edit

  end

  def add_tag
    @project.categories << Category.find_by(id: params[:category_id])
  end

  def remove_tag
    category = Category.find_by(id: params[:category_id])
    @project.categories.delete(category)
    # redirect_to root_path
    respond_to do |format|
      format.js 
    end

  end



  def display
    @user = current_user
    @projects = @user.projects

  end

  def new
    # @categories = Category.all

    @project = Project.new

  end

  def all
    # @projects = Project.all
    @comments = @project.comments.page(params[:page]).order(created_at: :desc).per(5)
  end



  def show
    @comments = @project.comments.page(params[:page]).order(created_at: :desc).per(10)
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    # @project.categories << Category.find_by(id: params[:category_id])

    if @project.save

      render :show, status: :created, location: @project
    else
      render :new
    end
  end

  def update

    # cat = Category.find_by(id: params[:category_id])

    # cat = params[:category_id]

    params[:category_id].each do |cat|
      if @project.categories.include? Category.find_by(id: cat)
        next
      else
        @project.categories << Category.find_by(id: cat)
      end
    end


    if @project.update(project_params)
      render :show, status: :created, location: @project
    else
      render :edit
    end
  end

  def destroy
    # authorize :destroy, @project
    @project.destroy
    redirect_to root_path
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :url, :project_photo, :lead, :description, :repository, :user_id, categories_attributes: [:id, :name, :category_id])
  end

end
