class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def new
    @professor = Professor.new
  end

  def create
    @professor = Professor.new
    @professor.name = params[:name]
    @professor.title = params[:title]
    @professor.bio = params[:bio]
    @professor.image_url = params[:image_url]
    @professor.email = params[:email]
    @professor.course_id = params[:course_id]

    if @professor.save
      redirect_to "/professors", :notice => "Professor created successfully."
    else
      render 'new'
    end
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    @professor = Professor.find(params[:id])

    @professor.name = params[:name]
    @professor.title = params[:title]
    @professor.bio = params[:bio]
    @professor.image_url = params[:image_url]
    @professor.email = params[:email]
    @professor.course_id = params[:course_id]

    if @professor.save
      redirect_to "/professors", :notice => "Professor updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @professor = Professor.find(params[:id])

    @professor.destroy

    redirect_to "/professors", :notice => "Professor deleted."
  end
end
