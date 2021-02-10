class MyTasksController < ApplicationController
    before_action :set_my_task, only: [:update]

    def index
       @my_tasks= Task.where(assignee_id: current_user.id).all
      end


      def update 
        if @my_task.update(task_params)
           redirect_to my_tasks_url, notice: 'Task was successfully updated.'         
        else
           render :edit  
        end     
    end

    private

    def set_my_task
        @my_task = Task.where(assignee_id: current_user.id).find(params[:id])
      end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:my_task).permit(:title , :assignee_id)
    end


end