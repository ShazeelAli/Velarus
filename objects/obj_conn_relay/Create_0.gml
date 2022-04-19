global.RelayServerIP = "localhost"
global.RelayServerPort = 3000;
network_set_config(network_config_connect_timeout, 20000)
global.socket = network_create_socket(network_socket_tcp)
global.server = network_connect_raw_async(global.socket,global.RelayServerIP,global.RelayServerPort)

start_stream = false;
data_stream =""

room_code = ""
Host = ""
clients_connected = []
clients_connected_data = {}
