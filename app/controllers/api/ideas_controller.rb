class Api::IdeasController < ApplicationController

  def index
    @ideas = Idea.all 
    render json: @ideas
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      render json: @idea
    else
      render json: { errors: { message: "This idea did not save"}}
    end
  end

  def show
    render json: Idea.find_by(id: params[:id])
  end

  def destroy
    @idea = Idea.find_by(id: params[:id])
    if @idea && @idea.destroy
      render status: 204
    else
      render json: { errors: "Unable to delete this idea" }
    end
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

end
