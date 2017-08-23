class SubjectsController < ApplicationController

  # model_name.instance_variable_set(:@route_key, 'subject')

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
