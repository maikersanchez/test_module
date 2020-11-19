defmodule ScheduleServer2Test do
  use ExUnit.Case
  doctest ScheduleServer2

  def check_default_values(server) do
    assert server.is_read == false
    assert server.is_running == false
    assert server.has_context == false
  end

  test "Creates a ScheduleServer" do
    server = %ScheduleServer2{}
    check_default_values(server)
  end

  test "Start link" do
    {:ok, server_pid} = ScheduleServer2.start_link()
    server = Agent.get(server_pid, fn state -> state end)
    check_default_values(server)
  end

  test "Read config file one and many time without starting" do
    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    assert {:error, :already_read} == ScheduleServer2.read_system_config_file(server)
  end

  test "Read config file after starting" do
    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    :ok = ScheduleServer2.start(server)
    assert {:error, :already_running} == ScheduleServer2.read_system_config_file(server)
  end

  test "Throws error when server starts without reading config files" do
    {:ok, server} = ScheduleServer2.start_link()
    {:error, :no_config_files} = ScheduleServer2.start(server)
  end

  test "Start one and many time" do
    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    :ok = ScheduleServer2.start(server)
    {:error, :already_running} = ScheduleServer2.start(server)
  end

  test "Throws error when initialize context without start server" do
    {:ok, server} = ScheduleServer2.start_link()
    {:error, :server_not_running} = ScheduleServer2.initialize_context(server)

    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    {:error, :server_not_running} = ScheduleServer2.initialize_context(server)
  end

  test "Initialize context with success" do
    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    :ok = ScheduleServer2.start(server)
    :ok == ScheduleServer2.initialize_context(server)
  end

  test "Throws error when destroy server without context" do
    {:ok, server} = ScheduleServer2.start_link()
    {:error, :already_destroyed} = ScheduleServer2.destroy(server)
  end

  test "Destrories a sever with context" do
    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    :ok = ScheduleServer2.start(server)
    :ok = ScheduleServer2.initialize_context(server)
    assert :ok == ScheduleServer2.destroy(server)
  end

  test "Throws error when shutdowns server when server is running" do
    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    :ok = ScheduleServer2.start(server)
    {:error, :not_destroyed} = ScheduleServer2.shutdown(server)
  end

  test "Shutdowns the sever" do
    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    assert :ok == ScheduleServer2.shutdown(server)

    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file(server)
    :ok = ScheduleServer2.start(server)
    :ok = ScheduleServer2.initialize_context(server)
    :ok = ScheduleServer2.destroy(server)
    assert :ok == ScheduleServer2.shutdown(server)
  end

  test "Handles error for start!" do
    {:ok, server} = ScheduleServer2.start_link()

    try do
      ScheduleServer2.start!(server)
      raise "ScheduleServer.start! must raise an error"
    rescue
      e -> assert is_atom(e.message)
    end

    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file!(server)
    assert :ok == ScheduleServer2.start!(server)
  end

  test "Handles error for initialize_context!" do
    {:ok, server} = ScheduleServer2.start_link()

    try do
      ScheduleServer2.initialize_context!(server)
      raise "ScheduleServer.initialize_context! must raise an error"
    rescue
      e -> assert is_atom(e.message)
    end

    {:ok, server} = ScheduleServer2.start_link()
    :ok = ScheduleServer2.read_system_config_file!(server)
    :ok = ScheduleServer2.start!(server)
    assert :ok == ScheduleServer2.initialize_context!(server)
  end

end
