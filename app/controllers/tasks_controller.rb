class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new task_params
    if task.save!
      flash[:success] = "New task created!"
      redirect_to root
    else
      render :new
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    task = current_user.home.tasks.find params[:id]
    if @task.update! task_params
      flash[:success] = "Task updated!"
      redirect_to root
    else
      render :edit
    end
  end

  def destroy
    task = Task.find params[:id]
    if task.delete!
      flash[:warning] = "Task deleted!"
    end
  end

  def index
    tasks_list = current_user.home.tasks
                  .select(:id, :name, :points, :deadline, :status, :room, :action, :user_id)

    @user_tasks = tasks_list.where('user_id = ? AND status != ?', current_user, 'done')
    @unclaimed_tasks = tasks_list.where(user_id: nil)
    @home_tasks = tasks_list.where.not(user_id: [nil, current_user.id])
  end

  def show
    @task = Task.find params[:id]
  end

  def done
    task = current_user.tasks.find(params[:task_id])
    if task.done!
      flash[:success] = "Task done!"
      if task.every.present? || task.every == 0
        new_deadline = task.since_done ? Date.today + task.every : task.dateline + task.every
        Task.create name: task.name, points: task.points, deadline: new_deadline,
                    every: task.every, since_done: task.since_done, status: "claimable",
                    picture: task.picture, tags: task.tags, room: task.room, 
                    action: task.action, home_id: task.home_id
      end
    end
    redirect_to tasks_path
  end

  def claim
    task = current_user.home.tasks.find(params[:task_id])
    task.user_id = current_user.id
    if task.save!
      flash[:success] = "Task claimed!"
    end
    redirect_to tasks_path
  end

  private

    def task_params
      params.require(:task).permit :name, :points, :deadline, :every, :since_done,
                                   :status, :room, :action
    end
end
