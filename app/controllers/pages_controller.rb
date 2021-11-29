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
    # refactored into page_params method.
    # on the next like, Page.new will act upon the return value of the call toe page_params

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

  def update

    # find the model data
    @page = Page.find(params[:id])

    # line was remove and refactored into page_params method

    # update model object with new data from edit form
    @page.update(page_params)

    # redirect browser to view updated page
    redirect_to @page
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    # redirect to the pages_path method (pages_path is not a variable)
    redirect_to pages_path
  end



  # all methods below private keyword is only available to pages_controller.rb
  private

    def page_params
      # refactor code.
      # page_prams is repeated in update and create
      page_params = params.require(:page).permit(:title, :body, :slug)
    end

end
