class BilisController < ApplicationController
  # GET /bilis
  # GET /bilis.json
  def index
    @bilis = Bili.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bilis }
    end
  end

  # GET /bilis/1
  # GET /bilis/1.json
  def show
    @bili = Bili.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bili }
    end
  end

  # GET /bilis/new
  # GET /bilis/new.json
  def new
    @bili = Bili.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bili }
    end
  end

  # GET /bilis/1/edit
  def edit
    @bili = Bili.find(params[:id])
  end

  # POST /bilis
  # POST /bilis.json
  def create
    @page = Page.find(params[:page_id])
    @bili = @page.bilis.create(params[:bili].merge({user_id: current_user.id}))
    redirect_to comic_page_path(@page.comic, @page)
  end

  # PUT /bilis/1
  # PUT /bilis/1.json
  def update
    @bili = Bili.find(params[:id])

    respond_to do |format|
      if @bili.update_attributes(params[:bili])
        format.html { redirect_to @bili, notice: 'Bili was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bili.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bilis/1
  # DELETE /bilis/1.json
  def destroy
    @bili = Bili.find(params[:id])
    @bili.destroy

    respond_to do |format|
      format.html { redirect_to bilis_url }
      format.json { head :no_content }
    end
  end
end
