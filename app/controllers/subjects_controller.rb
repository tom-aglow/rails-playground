class SubjectsController < ApplicationController

  # model_name.instance_variable_set(:@route_key, 'subject')

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'default'})
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)

    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form so user can fix issues
      render('new')
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
