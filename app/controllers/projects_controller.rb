class ProjectsController < ApplicationController
  # before_action :set_project, only: [:all, :display, :add_category, :remove_category]
                                      # :show, :edit, :update, :destroy,
  before_action :authenticate_user!, only: [:new, :display]


  # skip_before_action :verify_authenticity_token
  # load_and_authorize_resource
  # authorize_resource :only => [:add_category, :remove_category, :edit, :display, :show, :edit, :update, :destroy]
  #                             # , :all
  # load_resource

  load_and_authorize_resource

  skip_authorize_resource :only => [:add_category, :remove_category] #, :all, :display

  def add_category
    @project.categories << Category.new(name: params[:name])
    redirect_to root_path
  end

  def remove_category
    category = Category.find(params[:category_id])
    @project.categories.delete(category)
    redirect_to root_path
  end

  def index
    @projects = Project.all
  end

  def edit
    # @category = Category.all
    # ids = []
    # Category.all.each do |cat|
    #   unless @project.categories.include?(cat)
    #     ids.push(cat.id)
    #   end
    # end
    # @nonSelectedCategories = Category.where("id IN (?)", ids)

  end

  def display
    @user = current_user
    @projects = @user.projects
  end

  def new
    @project = Project.new
  end

  def all
    @projects = Project.all
  end

  def show
    @comments = @project.comments
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      render :show, status: :created, location: @project
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      render :show, status: :created, location: @project
    else
      render :edit
    end
  end

  def destroy
    # authorize :destroy, @project
    @project.destroy
    redirect_to projects_path
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :url, :project_photo, :lead, :description, :repository, :user_id, categories_attributes: [:id, :name])
  end

end
