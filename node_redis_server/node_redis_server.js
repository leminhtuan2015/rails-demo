var app = require('http').createServer(handler) 
	,io = require('socket.io').listen(app)
	,redis = require('redis').createClient();

var cli = 0;  

app.listen(1234);
redis.subscribe('happy');
console.log("Server nodejs is on :1234");
console.log("Server redis is on  :channel happy");

function handler (req, res) {
    console.log("HTTP Client Connected");
    res.writeHead(200);
    res.end("hello happy");
}

io.on('connection', function(socket){
  cli ++;
  console.log(" Client : " + cli + "-------socket connected...redis is on------"); 
  redis.on('message', function(channel, data){
    from = JSON.parse(data).from;
    to = JSON.parse(data).to;
    sms = JSON.parse(data).sms;
    socket.emit(to, sms);
    console.log("f: " + from + " to: "+ to + " sms: " + sms);
  });

  redis.on('error', function(channel, message){
    console.log("Error redis...");
  });
});

