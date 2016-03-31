var express = require('express'),
	logger = require('morgan');

var app = express();
app.use(logger);

app.get('/', function(request, response) {
  response.send('Hello World!');
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log("Listening on " + port);
});