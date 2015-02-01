class CutesController < ApplicationController
  before_action :set_cute, only: [:show, :edit, :update, :destroy]

  POSSIBLE_SAYINGS = [
    "You want MOAR?!",
    "OMG THIS IS 3 CUTE 5 ME",
    "Holy crap you guise",
    '"I CAN\'T EVEN" - Basic white girls',
    "*squishsquishsquish",
    "太可爱了！",
    "IT'S SO KAWAII"
  ]

  # GET /cutes
  # GET /cutes.json
  def index
    @cutes = Cute.all
  end

  # GET /cutes/1
  # GET /cutes/1.json
  def show
  end

  # GET /cutes/new
  def new
    @cute = Cute.new
  end

  # GET /cutes/1/edit
  def edit
  end

  # POST /cutes
  # POST /cutes.json
  def create
    @cute = Cute.new(cute_params)

    respond_to do |format|
      if @cute.save
        format.html { redirect_to @cute, notice: 'Cute was successfully created.' }
        format.json { render :show, status: :created, location: @cute }
      else
        format.html { render :new }
        format.json { render json: @cute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cutes/1
  # PATCH/PUT /cutes/1.json
  def update
    respond_to do |format|
      if @cute.update(cute_params)
        format.html { redirect_to @cute, notice: 'Cute was successfully updated.' }
        format.json { render :show, status: :ok, location: @cute }
      else
        format.html { render :edit }
        format.json { render json: @cute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cutes/1
  # DELETE /cutes/1.json
  def destroy
    @cute.destroy
    respond_to do |format|
      format.html { redirect_to cutes_url, notice: 'Cute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_another
    offset = rand(Cute.count)
    next_url = Cute.offset(offset).first.url
    next_saying = POSSIBLE_SAYINGS[rand(POSSIBLE_SAYINGS.count - 1)]

    r = {url: next_url, button_text: next_saying}
    render json: r
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cute
      @cute = Cute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cute_params
      params.require(:cute).permit(:url)
    end
end
