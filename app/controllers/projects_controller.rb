class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_category, :remove_category]
  before_action :authenticate_user!, except: [:index]

  def add_category
    @project.categories << Category.new(name: params[:name])
    redirect_to root_path
  end

  def remove_category
    category = Category.find(params[:category_id])
    @project.categories.delete(category)
    redirect_to root_path
  end

  # def get_categories
  #   @categories = Category.find(params[:category_id])
  # end

  def index
    @projects = Project.all
  end

  def edit
  end

  def display
    @user = current_user
    @projects = @user.projects
  end

  def new
    @project = Project.new
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
    @project.destroy
    redirect_to projects_path
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :url, :project_photo, :lead, :description, :repository, :user_id, categories_atributes: [:id, :category_id, :name])
  end

end
