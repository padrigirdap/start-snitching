class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
