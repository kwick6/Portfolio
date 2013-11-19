class ProjectsController < ApplicationController
  # before_filter :set_project, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!, except: [:show, :index]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # PROJECT /projects
  # PROJECT /projects.json
  def create
    @project = Project.create!(params[:project])
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully created, Yay!' }
      format.js   {}
    end
  end


  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    @oroject.update_attributes!(params[:project])
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to projects_url  }
      format.js
    end
  end


  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :details, :content, :name, :author_id)
    end
  end
