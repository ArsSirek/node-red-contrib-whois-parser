var exec = require("child_process").exec;
var path = require("path");

var absolutePath = path.resolve(`${__dirname}/whois-parse.rb`);

module.exports = function(RED) {
	function whoisParser(config) {
		RED.nodes.createNode(this, config);
		var node = this;

		node.on('input', function (msg) {


			node.status({
				fill: "orange",
				shape: "dot",
				text: `requesting whois`,
			});

			exec(`ruby ${absolutePath} ${msg[config.domain_field]}`, function (err, stdout, stderr) {
				if (err || stderr) {
					node.status({
						fill: "red",
						shape: "dot",
						text: `error on ruby cmd exec`,
					});
					node.error(err || stderr);
				} else if (stdout !== '') {
					node.status({
						fill: "green",
						shape: "dot",
						text: `response recived`,
					});
					node.send({payload: stdout});
				} else {
					node.status({
						fill: "red",
						shape: "dot",
						text: `extension not supported`,
					});
					node.error('something went wrong during the parsing, please open an issue on github');
				}
			});
		});
	}
	RED.nodes.registerType("whois-parser", whoisParser);
}
