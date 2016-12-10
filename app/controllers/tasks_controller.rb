class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new task_params
    if task.save!
      flash[:success] = "New task created successfully!"
      redirect_to root
    else
      render :new
    end
  end

  def edit
  end

  def update
    task = current_user.home.tasks.find params[:id]
    if @task.update! task_params
      flash[:success] = "Task updated successfully!"
      redirect_to root
    else
      render :edit
    end
  end

  def destroy
  end

  def index
    @user_tasks = current_user.tasks.where.not(status: 'done')
                  .select(:id, :name, :points, :deadline)
                  .order(:deadline).to_a
    @home_tasks = current_user.home.tasks.where(user_id: nil)
                  .select(:id, :name, :points, :deadline)
                  .order(:deadline).to_a
  end

  def show
  end

  def done
    task = current_user.tasks.find(params[:task_id])
    if task.done!
      flash[:success] = "Task done!"
      if task.every.present? || task.every == 0
        new_deadline = task.since_done ? Date.today + task.every : task.dateline + task.every
        Task.create name: task.name, points: task.points, deadline: new_deadline,
                    every: task.every, since_done: task.since_done, status: "claimable",
                    picture: task.picture, tags: task.tags, home_id: task.home_id
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
                                   :status, :tags
    end
end
