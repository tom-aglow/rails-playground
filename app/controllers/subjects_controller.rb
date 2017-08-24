class SubjectsController < ApplicationController

  layout 'admin'

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
      flash[:notice] = "Subject '#{@subject.name}' was successfully created"
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form so user can fix issues
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @subject = Subject.find(params[:id])

    # Save the object
    if @subject.update_attributes(subject_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Subject '#{@subject.name}' was successfully updated"
      redirect_to(subject_path(@subject))
    else
      # If save fails, redisplay the form so user can fix issues
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' was successfully deleted"
    redirect_to(subjects_path)
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
