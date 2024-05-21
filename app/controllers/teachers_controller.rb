class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.all.sort_by {|obj| obj.name}
  end

  # GET /teachers/1 or /teachers/1.json
  def show
    @totExternalThings = @teacher.evaluations.where(externalThings: true).count
    @totGoodKnoledge = @teacher.evaluations.where(goodKnoledge: true).count
    @totTakeAgain = @teacher.evaluations.where(takeAgain: true).count
    @totAttendenceDemand = @teacher.evaluations.where(attendenceDemand: true).count
    @totUsedTime = @teacher.evaluations.where(usedTime: true).count
    @totEvaluations = @teacher.evaluations.count
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers or /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_prof_score(teacher)
    @teacher = teacher
    grade = 0.0
    count = 0
    @teacher.evaluations.each do |e|
        grade += e.overallGrade
        count += 1
    end
    @teacher.overallGrade = grade/count
    @teacher.overallGrade.round(2)
    @teacher.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.fetch(:teacher, {})
    end
end
