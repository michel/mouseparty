WebsocketRails.setup do |config|
  config.standalone = false
  config.synchronize = false
end
WebsocketRails::EventMap.describe do
  subscribe :client_connected,    to: PartyHostController, with_method: :client_connected
  subscribe :mousemove,           to: PartyHostController, with_method: :mousemove
  subscribe :client_disconnected, to: PartyHostController, with_method: :client_disconnected
end
