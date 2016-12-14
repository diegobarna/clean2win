class TasksController < ApplicationController
  def new
    @task = current_user.home.tasks.new
  end

  def create
    task = current_user.home.tasks.new task_params
    if task.save!
      flash[:success] = "New task created!"
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @task = current_user.home.tasks.find params[:id]
  end

  def update
    task = current_user.home.tasks.find params[:id]
    if task.update! task_params
      flash[:success] = "Task updated!"
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    task = current_user.home.tasks.find params[:id]
    if task.delete!
      flash[:warning] = "Task deleted!"
    end
  end

  def index
    tasks_list = current_user.home.tasks
                  .select(:id, :name, :points, :deadline, :status, :room, :action, :user_id)

    @user_tasks = current_user.tasks.where('status != ?', 'done')
    @unclaimed_tasks = tasks_list.where(user_id: nil)
    @home_tasks = tasks_list.where.not(user_id: [nil, current_user.id])
  end

  def show
    @task = current_user.home.tasks.find params[:id]
  end

  def done
    task = current_user.tasks.find(params[:task_id])
    task.user.points += task.points
    task.user.save!
    task.status = "done"
    task.save!
    if task.every.present? || task.every == 0
      new_task = Task.new name: task.name, points: task.points, deadline: task.new_deadline,
                  every: task.every, since_done: task.since_done, status: "claimable",
                  room: task.room, action: task.action, home_id: task.home_id, user_id: nil
      new_task.save!
    end
    redirect_to tasks_path
  end

  def claim
    task = current_user.home.tasks.find(params[:task_id])
    task.user_id = current_user.id
    task.status = 'claimed'
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
