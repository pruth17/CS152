
var net = require('net');

var eol = require('os').EOL;

 

var srvr = net.createServer();

var clientList = [];

 

var listCmd = "\\list";

var renameCmd = "\\rename";

var privateCmd = "\\private";

 

srvr.on('connection', function(client) {

  client.name = client.remoteAddress + ':' + client.remotePort;

  client.write('Welcome, ' + client.name + eol);

  clientList.push(client);

 

  client.on('data', function(data) {

    process(data, client);

  });

});

 

function process(data, client) {

    data += '';

    if (data == eol)

        return;

    

    var cleanData = data;

    if (cleanData.indexOf(eol) !== -1)

        cleanData = cleanData.substring(0, cleanData.indexOf(eol));

    

    var input = ('' + cleanData).split(' ');

    if (input.length > 0) {

        

        if(input[0] === listCmd){

                client.write("List of Peoples: ");

                for (let i of clientList)

                    if (i !== client)

                        client.write(i.name + " ");

                client.write(eol);

               

        }

       else if(input[0] === renameCmd){

                if (input.length > 1) {

                    var cleanName = input[1] + '';

                    //if (cleanName.indexOf(eol) !== -1) //accidental eol cleanup

                        //cleanName = cleanName.substring(0, cleanName.indexOf(eol));

                    client.name = cleanName;

                    client.write("New name: " + cleanName + eol);

                } else

                    client.write("Error: No Name Provided" + eol)

                    }

       else if(input[0] === privateCmd) {

                if (input.length > 2){

                    for (let i of clientList)

                        if (i.name == input[1])

                            i.write(client.name + " DMed you " + cleanData.substring(cleanData.indexOf(input[2])) + eol);

                } else

                    client.write("Error: No Message");

        }

        else {

                broadcast(cleanData + eol, client);

        }

        

    }

}

 

function broadcast(data, client) {

  for (var i in clientList) {

    if (client !== clientList[i]) {

      clientList[i].write(client.name + " says " + data);

    }

  }

}

 

srvr.listen(9000);