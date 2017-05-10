class Admin::TestimonialsController < AdminController

  def index
    @testimonials = Testimonial.all.order("created_at DESC")
  end

  def show
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @testimonial = Testimonial.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @testimonial = Testimonial.find(params[:id])

  end

  def create
    @testimonial = Testimonial.new(testimonial_params)

    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to(admin_testimonials_url, :notice => 'Testimonial was successfully created.') }
      else
        @testimonials = Testimonial.all
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])



    respond_to do |format|
      if @testimonial.update_attributes(testimonial_params)

        format.html { redirect_to(admin_testimonials_url, :notice => 'Testimonial was successfully updated.') }
      else
        @testimonials = Testimonial.all
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy

    respond_to do |format|
      format.html { redirect_to(admin_testimonials_url) }
    end
  end

  private

    def testimonial_params
      params.require(:testimonial).permit(:full_name, :review_text, :client_title, :client_image)
    end

end
