class TasksController < ApplicationController
  def index
    # authorize @task
    @tasks = policy_scope(Task).order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = Task.find(params[:id])
    # @task = Task.update(task_params)
    if @task.update(task_params)
      redirect_to @task, notice: 'task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end
end

