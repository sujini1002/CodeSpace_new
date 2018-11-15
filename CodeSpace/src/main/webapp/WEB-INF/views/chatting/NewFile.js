var express = require('express');
var host = "115.94.144.228"
var app = express();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

app.get("/",function(req, res){
  res.sendFile(__dirname+"/chatting.html");
});

var count=1;
io.on('connection', function(socket){
  console.log('user connected: ', socket.id);
  var name = "user" + count++;
  io.to(socket.id).emit('change name',name);

  socket.on('disconnect', function(){
    console.log('user disconnected: ', socket.id);
  });
  
  socket.on('send message', function(name,text){
    var msg = name + ' : ' + text;
    console.log(msg);
    io.emit('receive message', msg);
  });
});

http.listen('3000', function(){
  console.log("server on!:3000");
});