class ProjectsController < ApplicationController
	def index
		@project = Project.all
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




	private

	def project_params
		params.require(:project).permit(:name, :description, :image)		
	end
end
