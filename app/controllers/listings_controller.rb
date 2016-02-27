class ListingsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update]
  before_filter :set_listing_context, only: [:show, :edit]

  def index
    @listings = Listing.includes(:address)
  end

  def new
    @listing = Listing.new
  end

  def edit
    unless @listing.user == current_user
      flash[:error] = "Sorry, you do not have authorization to edit this listing"
      redirect_to :back
    end
  end

  def show
  end

  def create
    @listing = Listing.new
  end

  def update
  end

  private

  def set_listing_context
    @listing = Listing.where(id: param[:id]).first
    if @listing.nil?
      flash[:error] = "Sorry, listing not found"
      redirect_to listings_path
    end
  end

end