class CommentsController < ApplicationController
  # before_action :set_comment, only: [:destroy]
  # before_action :authenticate_user!, except: [:index]
  # authorize_resource
  load_and_authorize_resource



  def create
    @project = Project.find(params[:project_id])
		@comment = Comment.new(content:params[:comment][:content], user: current_user)
		@project.comments << @comment
		@comment.save
    # redirect_to @project
    # render 'projects/create'
    # render :json => @comment.to_json
  end

  def destroy
    # authorize :destroy, @comment

    @project = Project.find(params[:project_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @project
  end

  # def index
  #   @comments = Comment.all
  # end
  #
  # def new
  #   @comment = Comment.new
  # end
  #
  # def show
  # end
  #
  # def edit
  # end
  #
  # def update
  #   if @comment.update(comment_params)
  #     render :show, status: :created, location: @comment
  #   else
  #     render :edit
  #   end
  # end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :project_id)
  end


end
