var exec = require("child_process").exec;
var path = require("path");

var absolutePath = path.resolve("./node_modules/node-red-contrib-whois-parser/whois-parse.rb");


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
				} else {
					node.status({
						fill: "green",
						shape: "dot",
						text: `response recived`,
					});
					node.send({payload: stdout});
				}
			});
		});
	}
	RED.nodes.registerType("whois-parser", whoisParser);
}
