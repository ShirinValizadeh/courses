
module Admin
class PostingsController <  BaseController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]

  # GET /postings
  # GET /postings.json
  def index
    @postings = Posting.all
  end

  # GET /postings/1
  # GET /postings/1.json
  def show
  end

  # GET /postings/new
  def new
    @posting = current_user.postings.build
  end

  # GET /postings/1/edit
  def edit
  end

  # POST /postings
  # POST /postings.json
  def create
    @posting = current_user.postings.build(posting_params)
    @posting.user = current_user
    respond_to do |format|
      if @posting.save
         redirect_to admin_postings_url, notice: 'Posting was successfully created.' 
  
      else
        render :new 
      
      end
    end
  end

  # PATCH/PUT /postings/1
  # PATCH/PUT /postings/1.json
  def update
    respond_to do |format|
      if @posting.update(posting_params)
       redirect_to admin_postings_url, notice: 'Posting was successfully updated.' 
 
      else
       render :edit 
       
      end
    end
  end

  # DELETE /postings/1
  # DELETE /postings/1.json
  def destroy
    @posting.destroy
    respond_to do |format|
     redirect_to postings_url, notice: 'Posting was successfully destroyed.' 
    
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting
      @posting = current_user.postings.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posting_params
      params.require(:posting).permit(:title, :description)
    end
end

end