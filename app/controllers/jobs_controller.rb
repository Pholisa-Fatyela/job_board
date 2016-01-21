class JobsController < ApplicationController
	 before_action :set_job, only: [:show, :edit, :update, :destroy]

	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		Job.create(job_params)
		redirect_to jobs_path
	end

	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.update(job_params)
		redirect_to jobs_path
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_path
	end

	private
	def set_job
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:title, :description, :requirements, :job_level, :status, :start_date, :contact)
	end
end
