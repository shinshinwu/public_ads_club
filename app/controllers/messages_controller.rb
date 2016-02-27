class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_message_context, only: [:create]

  def show
  end

  def create
    @message = Message.new
    @message.listing_id = @listing.id
    @message.sender_id = @user.id
    @message.recipient_id = @listing.user.id
    @message.subject = params[:message][:subject]
    @message.body = params[:message][:body]
    @message.start_date = Date.new(params[:message]["start_date(1i)"].to_i, params[:message]["start_date(2i)"].to_i, params[:message]["start_date(3i)"].to_i)
    @message.end_date = Date.new(params[:message]["end_date(1i)"].to_i, params[:message]["end_date(2i)"].to_i, params[:message]["end_date(3i)"].to_i)

    if @message.end_date <= @message.start_date
      flash[:error] = "Sorry, your desired end date is before your desired start date!"
      redirect_to :back and return
    end

    begin
      @message.save!
    rescue => e
      flash[:error] = "#{e.message}"
      redirect_to :back and return
    end
    flash[:success] = "Your message has been sent!"
    redirect_to listing_path(@listing)
  end

  private

  def set_message_context
    @user = current_user
    @listing = Listing.where(id: params[:message][:listing_id]).first
    if @listing.nil?
      flash[:error] = "Sorry, the listing you are inquiring is not valid"
      redirect_to :back and return
    end
  end
end