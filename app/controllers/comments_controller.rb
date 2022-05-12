class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit reply_on_tree update destroy ]

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.turbo_stream do
          render turbo_stream: [
                   turbo_stream.append("comments",
                                       partial: "comments/tree_comments",
                                       locals: {comment: @comment})
          ]
        end
      end
    end

  #  if @comment.save
  #    redirect_to @comment, notice: "Comment was successfully created."
  #  else
  #    render :new, status: :unprocessable_entity
  #  end
  end

  def show_tree
    @tree_comments = Comment.where(parent_type: "comment").where(parent_id: params[:id])
    render turbo_stream: turbo_stream.append("comment_#{params[:id]}",
                                              partial: "comments/tree_comments",
                                              collection: @tree_comments,
                                              as: :comment)
  end

def reply_on_tree
  render turbo_stream: turbo_stream.prepend("comment_#{params[:id]}",
                                           partial: "comments/normal_form",
                                           locals: {
                                                     comment: Comment.new,
                                                     parent_id: @comment.id,
                                                     parent_type: "comment"
                                                   }
                                           )
end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: "Comment was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :body, :parent_id, :parent_type)
    end
end
