defmodule PlugEx.Router do
  use Plug.Router

  plug :match
  plug :dispatch
  plug Plug.Static, at: "/home", from: :server

  get "/" do
    send_resp(conn, 200, "Hello World!")
  end

  get "/about/:username" do
    send_resp(conn, 200, "Hello #{username}")
  end

  get "/home" do
    conn = put_resp_content_type(conn, "text/html")
    send_file(conn, 200, "lib/index.html")
  end

  match _, do: send_resp(conn, 404, "Not found")
  
end