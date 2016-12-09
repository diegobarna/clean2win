class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "New task created successfully!"
      redirect_to home_tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @tasks = current_user.home.tasks.select(:id, :name, :points, :deadline)
                         .order(:deadline).to_a
  end

  def show
  end

  private

    def task_params
      params.require(:task).permit :name, :points, :deadline, :every, :since_done,
                                   :status, :tags
    end
end
