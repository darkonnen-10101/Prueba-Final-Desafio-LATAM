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

    @comments = @project.comments.page(params[:page]).order(created_at: :desc).per(5)


    # num = @comment.project.id
    # @comments = Project.find(num).comments.page(params[:page]).order(created_at: :desc).per(5)
    # redirect_to @project
    # render 'projects/create'
    # render json: @comment.as_json

    respond_to do |format|
      format.js {render 'projects/comcreate'}
      format.html {render 'projects/comcreate'}
    end



  end

  def destroy
    # authorize :destroy, @comment

    @project = Project.find(params[:project_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		# redirect_to @project
    respond_to do |format|
      format.js {render 'projects/comdestroy'}
    end

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
