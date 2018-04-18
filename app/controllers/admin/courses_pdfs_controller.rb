class Admin::CoursesPdfsController < AdminController

  def index
    @courses_pdf = CoursesPdf.last
  end

  def show
    @courses_pdf = CoursesPdf.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @courses_pdf = CoursesPdf.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @courses_pdf = CoursesPdf.find(params[:id])
  end

  def create
    @courses_pdf = CoursesPdf.new(courses_pdfs_params)

    respond_to do |format|
      if @courses_pdf.save
        format.html { redirect_to(admin_courses_pdfs_url, :notice => 'CoursesPdf was successfully created.') }
      else
        @courses_pdfs_pdf = CoursesPdf.all
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @courses_pdf = CoursesPdf.find(params[:id])

    respond_to do |format|3
      if @courses_pdf.update_attributes(courses_pdfs_params)

        format.html { redirect_to(admin_courses_pdfs_url, :notice => 'CoursesPdf was successfully updated.') }
      else
        @courses_pdfs_pdf = CoursesPdf.all
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @courses_pdf = CoursesPdf.find(params[:id])
    @courses_pdf.destroy

    respond_to do |format|
      format.html { redirect_to(admin_courses_pdfs_url) }
    end
  end

  private

    def courses_pdfs_params
      params.require(:courses_pdf).permit(:main_pdf)
    end

end
