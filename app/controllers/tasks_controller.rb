class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)
    @task.user = current_user
      if @task.save
      redirect_to tasks_url, notice: 'Task was successfully created.'  
      else
       # p @task.errors
        render :new 
      end
    
  end

  # PATCH/PUT /tasks/1
  def update
      if @task.update(task_params)
         redirect_to task_url, notice: 'Task was successfully updated.'       
      else
         render :edit 
      end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
     redirect_to tasks_url, notice: 'Task was successfully destroyed.' 
   
    end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title , :assignee_id)
    end

end
