class HomeController < ApplicationController

  layout 'new_design', only: [:new_homepage, :write_it_well, :adcomdesigns]

  def index
    @article = Article.where(active: true).last
  end

  def new_homepage
    @articles = Article.where("scheduled_date < ?", Time.now).order("scheduled_date DESC").limit(4)
    @clients = Client.order("created_at DESC")
    @testimonials = Testimonial.order("created_at DESC")
    @courses = Course.all.order("created_at ASC")
    @courses_pdf = CoursesPdf.last
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :index
    end
  end

  def write_it_well
    @courses = Course.all.order("created_at ASC")
    @courses_pdf = CoursesPdf.last
  end

end
