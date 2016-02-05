class ProjectsController < ApplicationController
	
	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def show
		@project = Project.find(params[:id])		
	end

	def create
		@project = Project.create(project_params)

		if @project.save
			flash[:success] = "Project successfully created"
			redirect_to project_path(@project)
		else
			flash[:error] = "A problem occurred when attempting to save this project."
			redirect_to new_project_path
		end
		
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)
		
		if @project.save
			flash[:success] = "Project updated successfully!"
			redirect_to @project
		else
			flash[:error] = "There was a problem updating the project."
			redirect_to action: :edit
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@projects = Project.all
		
		@project.destroy
		redirect_to action: :index
	end

	private

	def project_params
		params.require(:project).permit(:name, :description, :image)		
	end
end
