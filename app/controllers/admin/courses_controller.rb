class Admin::CoursesController < AdminController

  def index
    @courses = Course.all.order("created_at ASC")
  end

  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @course = Course.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to(admin_courses_url, :notice => 'Course was successfully created.') }
      else
        @courses = Course.all
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(course_params)

        format.html { redirect_to(admin_courses_url, :notice => 'Course was successfully updated.') }
      else
        @courses = Course.all
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(admin_courses_url) }
    end
  end

  private

    def course_params
      params.require(:course).permit(:title, :description, :book, :onsite, :webinar, :book_link, :icon, :pdf)
    end

end
