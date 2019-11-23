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

  def add_tag
    # @movie = Movie.find(params[:id])
    @project.tags << Tag.new(name: params[:name])
    # render json: @project.tags.as_json
    respond_to do |format|
      format.js
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end


  end

  def remove_tag

    tag = Tag.find(params[:tag_id])
    @project.tags.delete(tag)
    respond_to do |format|
      format.js
      format.html { redirect_to request.referrer }
      format.json {head :no_content}
    end
    # redirect_to root_path

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
    # @projects = Project.all
  end

  def show
    @comments = @project.comments
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

    # @project.categories << Category.find_by(id: params[:category_id]) unless @project.categories.where(id: params[:category_id]).exists?

    if @project.update(project_params)
       # @project.categories << Category.find_by(id: params[:category_id])
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
    params.require(:project).permit(:name, :url, :project_photo, :lead, :description, :repository, :user_id, :categories_attributes => [:id, :name])
  end

end
