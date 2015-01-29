  alert('node_redis_cli socket opened');
  var socket;
  socket = io.connect('http://localhost:1234');
  socket.on(<%=current_user.name%>, function(data) {
  //  alert(<%=current_user.name%> + " received");
    location.reload();
  });