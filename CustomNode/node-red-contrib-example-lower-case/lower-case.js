module.exports = function (RED) {
  function getField(node, kind, value) {
    switch (kind) {
      case 'flow':	// Legacy
        return node.context().flow.get(value);
      case 'global':
        return node.context().global.get(value);
      case 'num':
        return parseInt(value);
      case 'bool':
      case 'json':
        return JSON.parse(value);
      case 'env':
        return process.env[value];
      default:
        return value;
    }
  }

  function lowerCaseNode(config) {
    var node = this;
    RED.nodes.createNode(node, config);
    node.topic = config.topic;

    node.on('input', function (msg) {
      msg.payload = msg.payload.toLowerCase();
      node.send(msg);
    });
  }

  RED.nodes.registerType("lower-case", lowerCaseNode);
}