defmodule Facade1 do

  # defmodule ScheduleServer do
  #   @enforce_keys [:name]
  #   defstruct [:name, :process]
  # end

  # defmodule SockectServer do
  #   @enforce_keys [:name]
  #   defstruct [:name, :process, qty: 5]
  # end

  # defprotocol IFacade do
  #   def start(ifacade)
  #   def stop (ifacade)
  # end

  # defimpl IFacade, for: ScheduleServer  do
  #   @context "ScheduleServer"

  #   def start(server) do
  #     server
  #     |> init
  #     |> reeady_server
  #   end

  #   def stop(server) do
  #     server
  #     |> close
  #     |> destroy
  #     |> shutdown
  #   end

  #   defp init(server) do
  #     new_status = "Initializating server #{@context}"
  #     set(server, @context, new_status)
  #     # IO.puts(new_status)
  #     # server
  #     %Facade.ScheduleServer{name: @context, process: new_status}
  #   end

  #   defp reeady_server(current) do
  #     Process.sleep(800)
  #     status = "Server #{@context} is ready"
  #     IO.puts(status)
  #     current = set(current, @context, status)
  #     IO.inspect(current)
  #     current
  #   end

  #   defp close(current) do
  #     Process.sleep(200)

  #     cond do
  #       current.process == "Server ScheduleServer is ready" ->
  #         status = "clousing server #{@context}"
  #         IO.puts(status)
  #         current = set(current, nil, status)
  #         current
  #       true -> throw("The server state must be running")

  #     end

  #     status = "clousing server #{@context}"
  #     IO.puts(status)
  #     current = set(current, nil, status)
  #     current
  #   end

  #   defp destroy(current) do
  #     Process.sleep(600)
  #     status = "Destroying server #{@context}"
  #     IO.puts(status)
  #     current = set(current, nil, status)
  #     current
  #   end

  #   defp shutdown(current) do
  #     status = "Shutdown server #{@context}"
  #     IO.puts(status)
  #     current = set(current, nil, status)
  #     current
  #   end

  #   defp set(server, new_name, new_status) do
  #     if new_name != nil do
  #       IO.puts("map " <> Map.get(server, :name))
  #       IO.puts("new " <> new_name)
  #       # IO.puts("map " <> Map.set(server, :name, new_name))
  #       # server = % new_name
  #       # Map.put(server, :name, new_name)
  #       # Map.put(server, :name, "new_name")
  #       server = Map.replace(server, :name, new_name)
  #       # server = %Facade.ScheduleServer{name: new_name}
  #       IO.puts(server.name)
  #     end

  #     if new_status != nil do
  #       IO.puts("new status " <> new_status)
  #       Map.put(server, :process, new_status)
  #       # server = %Facade.ScheduleServer{process: new_status}
  #     end
  #   end
  # end

  # defimpl IFacade, for: SockectServer  do
  #   @context "SockectServer"

  #   def start(server) do
  #     server
  #     |> init
  #     |> reeady_server
  #   end

  #   def stop(server) do
  #     server
  #     |> close
  #     |> destroy
  #     |> shutdown
  #   end

  #   defp init(current) do
  #     status = "Initializating server #{@context}"
  #     IO.puts(status)
  #     current = set(current, @context, status)
  #     current
  #   end

  #   defp reeady_server(current) do
  #     Process.sleep(800)
  #     status = "Server #{@context} is ready"
  #     IO.puts(status)
  #     current = set(current, nil, status)
  #     current
  #   end

  #   defp close(current) do
  #     cond do
  #       current.process == "Server SockectServer is ready" ->
  #         Process.sleep(200)
  #         status = "clousing server #{@context}"
  #         IO.puts(status)
  #         current = set(current, nil, status)
  #         current
  #        true -> throw("The server state must be running")
  #       end
  #   end

  #   defp destroy(current) do
  #     Process.sleep(600)
  #     status = "Destroying server #{@context}"
  #     IO.puts(status)
  #     current = set(current, nil, status)
  #     current
  #   end

  #   defp shutdown(current) do
  #     status = "Shutdown server #{@context}"
  #     IO.puts(status)
  #     current = set(current, nil, status)
  #     current
  #   end

  #   defp set(server, name, status) do
  #     if name != nil do
  #       Map.put(server, :name, name)
  #     end

  #     if status != nil do
  #       Map.put(server, :process, status)
  #     end
  #   end
  # end
end
