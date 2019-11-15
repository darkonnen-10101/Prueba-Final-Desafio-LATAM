class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

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
    params.require(:project).permit(:name, :url, :project_photo, :lead, :description, :repository, :user_id)
  end

end
