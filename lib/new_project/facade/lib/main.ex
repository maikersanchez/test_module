 alias Facade.ScheduleServer
# alias Facade.SockectServer
alias Facade.IFacade

shuedule1 = %ScheduleServer{name: "main"}
# IO.inspect(shudule)
server = IFacade.start(shuedule1)
IO.inspect(server)
IO.inspect(IFacade.stop(server))

# IO.puts("------------------------------")

# sockect = %SockectServer{name: "Process 1"}
# socServer = IFacade.start(sockect)
# IO.inspect(socServer)
# socServer = IFacade.stop(socServer)
# IO.inspect(IFacade.stop(socServer))

# IO.puts( %ScheduleServer{})



# shudule = %ScheduleServer{name: "main"}
# shudule = Map.replace(shudule, :name, "bar")
# shudule = Map.replace(shudule, :process, "nuevo name")

# IO.inspect(shudule);
# IO.inspect(shudule1)
# hd(shudule)
