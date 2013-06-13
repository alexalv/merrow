class ApplicationController < ActionController::Base
  protect_from_forgery


  helper_method :current_user
  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def self.client
    unless @client
      c = Bunny.new(:host => "192.168.1.101")
      c.start
      @client = c
    end
    @client
  end

  def self.nameless_exchange
    @nameless_exchange ||= client.exchange("")
  end

  def self.messages_queue
    @messages_queue ||= client.queue("ui.to.mng")
  end

  def publish
    # Send the message from the form's input box to the "messages"
    # queue, via the nameless exchange.  The name of the queue to
    # publish to is specified in the routing key.
      
    # Notify the user that we published.
    flash[:published] = true
    redirect_to root_path
  end
  
end
