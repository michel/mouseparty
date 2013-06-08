class PartyHostController < WebsocketRails::BaseController
  def client_connected
    broadcast_message :connected , 'client connected'
  end

  def mousemove
    broadcast_message :mousemove, cords: message[:cords].dup
  end

  def client_disconnected 
    broadcast_message :disconnected , 'client disconnected'
  end
end
