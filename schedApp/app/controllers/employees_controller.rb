class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]



  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json

  # We use Article.find to find the article we're interested in, passing in
  # params[:id] to get the :id parameter from the request.
  # We also use an instance variable (prefixed with @) to hold a reference to the article object.
  # We do this because Rails will pass all instance variables to the view.
  def show
    @employee = Employee.find(params[:id]) # show listing of all employees
  end

  # GET /employees/new
  def new
   @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
   # @employee = Employee.new(params.require(:article).permit(:title, :text))
   @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save #save returns bool
        flash.now[:notice] = 'Thanks for adding an employee...'
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end



  # Never trust parameters from the scary internet, only allow the white list through.
  private
  def employee_params
    params.require(:employee).permit(:name, :phone)
    # params.fetch(:employee, {})
  end


end
