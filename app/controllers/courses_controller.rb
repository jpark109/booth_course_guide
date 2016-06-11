class CoursesController < ApplicationController
  def my_enrolls
    @enrolls = current_user.enrolls
    @courses = current_user.enrolled_courses
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @ratings = @course.enrolls.pluck(:rating_info)
    @count = @ratings.count
    @sum = @ratings.sum

    if @count==0
      @mean = "n/a"
    else
      @mean = @sum/@count
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new
    @course.number = params[:number]
    @course.section = params[:section]
    @course.title = params[:title]
    @course.quarter = params[:quarter]
    @course.year = params[:year]
    @course.daytime = params[:daytime]
    @course.prereq = params[:prereq]
    @course.rating = params[:rating]
    @course.professor_id = params[:professor_id]
    @course.user_id = params[:user_id]

    if @course.save
      redirect_to "/courses", :notice => "Course created successfully."
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    @course.number = params[:number]
    @course.section = params[:section]
    @course.title = params[:title]
    @course.quarter = params[:quarter]
    @course.year = params[:year]
    @course.daytime = params[:daytime]
    @course.prereq = params[:prereq]
    @course.rating = params[:rating]
    @course.professor_id = params[:professor_id]
    @course.user_id = params[:user_id]

    if @course.save
      redirect_to "/courses", :notice => "Course updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    redirect_to "/courses", :notice => "Course deleted."
  end
end
