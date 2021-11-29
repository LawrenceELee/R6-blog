class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    # manually tell rails which params should be allowed to prevent malicious stuff
    page_params = params.require(:page).permit(:title, :body, :slug)

    # creates a new Page object with the accepted params
    @page = Page.new(page_params)

    # save the newly create Page object into model 
    @page.save

    # redirected to the show page for the new Page objectafter you submit form data
    redirect_to @page
  end

  def edit
    @page = Page.find(params[:id])
  end



end
