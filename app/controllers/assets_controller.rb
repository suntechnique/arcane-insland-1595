class AssetsController < ApplicationController
  #before_action :set_asset, only: [:show, :edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
    @assets = Asset.where(:sm_content_id => params[:sm_content_id])
		@smc = SmContent.find(params[:sm_content_id])
  end

  # GET /assets/1
  # GET /assets/1.json

  # GET /assets/new
  def new
    @asset = Asset.new
  end

  def addassets
	  @assets = Asset.where(:sm_content_id => params[:sm_content_id])
	  @smc = SmContent.find(params[:sm_content_id])
	  @smc.assets.build

	  respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @assets }
	  end
  end

  def deleteassets
	  @assets = Asset.where(:sm_content_id => params[:sm_content_id])
	  @smc = SmContent.find(params[:sm_content_id])
  end

  # GET /assets/1/edit
  def edit
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(asset_params)
    @smc = SmContent.find(params[:sm_content_id])

    respond_to do |format|
      if @asset.save
        format.html { redirect_to @smc, notice: 'Asset was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asset }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_paramss
	    #params.require(:sm_content).permit(:title, :content, :sm_content_id, :assets)
	    params.require(:sm_content_assetss).permit(:sm_content_id, assets:[])
      #params[:assets]
      #params[:assets_attributes]
    end
end
