class EnrollsController < ApplicationController
  def index
    if current_user == User.first
      @enrolls = Enroll.all
    else
      redirect_to "/users/#{current_user.id}", :notice => "Not allowed"
    end
  end

  def show
    @enroll = Enroll.find(params[:id])
  end

  def new
    @enroll = Enroll.new
  end

  def create
    @enroll = Enroll.new
    @enroll.user_id = params[:user_id]
    @enroll.course_id = params[:course_id]
    @enroll.rating_info = params[:rating_info]
    @enroll.rating_interest = params[:rating_interest]
    @enroll.rating_useful = params[:rating_useful]
    @enroll.rating_learn = params[:rating_learn]
    @enroll.rating_rec = params[:rating_rec]
    @enroll.rating_hours = params[:rating_hours]

    if @enroll.save
      redirect_to "/courses", :notice => "Added course successfully."
    else
      render 'new'
    end
  end

  def edit
    @enroll = Enroll.find(params[:id])
  end

  def update
    @enroll = Enroll.find(params[:id])

    @enroll.user_id = params[:user_id]
    @enroll.course_id = params[:course_id]
    @enroll.rating_info = params[:rating_info]
    @enroll.rating_interest = params[:rating_interest]
    @enroll.rating_useful = params[:rating_useful]
    @enroll.rating_learn = params[:rating_learn]
    @enroll.rating_rec = params[:rating_rec]
    @enroll.rating_hours = params[:rating_hours]

    if @enroll.save
      redirect_to "/users/1", :notice => "Rating updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @enroll = Enroll.find(params[:id])

    @enroll.destroy

    redirect_to "/users/#{@enroll.user_id}", :notice => "Withdrawn from course."
  end
end
