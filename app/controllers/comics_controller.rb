class ComicsController < ApplicationController
  authorize_resource
  # GET /comics
  # GET /comics.json
  respond_to :html, :json
  def index
    @comics = Comic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comics }
    end
  end

  # GET /comics/1
  # GET /comics/1.json
  def show

    @comic = Comic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comic }
    end
  end

  # GET /comics/new
  # GET /comics/new.json
  def new
    @comic = Comic.new
    5.times { @comic.pages.build }
    respond_with(@comic)
  end

  # GET /comics/1/edit
  def edit
    @comic = Comic.find(params[:id])
    5.times { @comic.pages.build }
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(params[:comic])
    @comic.user = current_user
    @comic.under_review = true

    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic, notice: 'Comic was successfully created.' }
        format.json { render json: @comic, status: :created, location: @comic }
      else
        format.html { render action: "new" }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comics/1
  # PUT /comics/1.json
  def update
    @comic = Comic.find(params[:id])

    respond_to do |format|
      if @comic.update_attributes(params[:comic])
        format.html { redirect_to @comic, notice: 'Comic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy

    respond_to do |format|
      format.html { redirect_to comics_url }
      format.json { head :no_content }
    end
  end

  def tagged
    #if params[:tag].present?
      @comics = Comic.tagged_with(params[:tag])
    #else
    #  @comics = Comic.postall
    #end
  end
  def tag_cloud
    @tags = Comic.tag_counts_on(:tags)
  end
end
