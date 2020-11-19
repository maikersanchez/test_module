defmodule Facade do

  defmodule ScheduleServer do
    @enforce_keys [:name]
    defstruct [:name, :process]
  end

  defmodule SockectServer do
    @enforce_keys [:name]
    defstruct [:name, :process, qty: 5]
  end

  defprotocol IFacade do
    def start(ifacade)
    def stop (ifacade)
  end

  defimpl IFacade, for: ScheduleServer  do
    @context "ScheduleServer"
    def start(server) do
      server
      |> init
      |> reeady_server
    end

    def stop(server) do
      server
      |> close
      |> destroy
      |> shutdown
    end

    defp init(server) do
      set(server, @context<>"-#{server.name}", "Initializating server #{@context}")
    end

    defp reeady_server(current) do
      Process.sleep(1000)
      set(current, current.name, "Server #{current.name} is ready")
    end

    defp close(current) do
      IO.puts(current.process)
      cond do
        current.process == "Server #{current.name} is ready" ->
          Process.sleep(1000)
          set(current, current.name, "clousing server #{current.name}")
        true -> throw("The server state must be running")
      end
    end

    defp destroy(current) do
      Process.sleep(5000)
      set(current, current.name, "Destroying server #{current.name}")
    end

    defp shutdown(current) do
      set(current, current.name, "Shutdown server #{current.name}")
    end

    defp set(server, new_name, new_status) do
      server
      |> Map.put(:name, new_name)
      |> Map.put(:process, new_status)
    end
  end

  defimpl IFacade, for: SockectServer  do
    @context "SockectServer"

    def start(server) do
      server
      |> init
      |> reeady_server
    end

    def stop(server) do
      server
      |> close
      |> destroy
      |> shutdown
    end

    defp init(server) do
      Process.sleep(1000)
      set(server, @context<>"-#{server.name}", "Initializating server #{@context}")
    end

    defp reeady_server(current) do
      Process.sleep(300)
      set(current, current.name, "Server #{current.name} is ready")
    end

    defp close(current) do
      cond do
        current.process == "Server #{current.name} is ready" ->
          Process.sleep(1000)
          set(current, current.name, "clousing server #{current.name}")
         true -> throw("The server state must be running")
        end
    end

    defp destroy(current) do
      Process.sleep(1000)
      set(current, current.name, "Destroying server #{current.name}")
    end

    defp shutdown(current) do
      set(current, current.name, "Shutdown server #{current.name}")
    end

    defp set(server, name, status) do
      server
      |> Map.put(:name, name)
      |> Map.put(:process, status)
    end
  end
end
