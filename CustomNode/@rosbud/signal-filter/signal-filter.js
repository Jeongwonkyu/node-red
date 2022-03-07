module.exports = function (RED) {
  function getField(node, kind, value) {
    switch (kind) {
      case 'flow': // Legacy
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

  function signalFilter(config) {
    const node = this;
    RED.nodes.createNode(node, config);

    // this.tag = RED.nodes.getNode(config.tag);

    node.on('input', function (msg, send, done) {
      console.log(config.tagname);
      // msg.payload = msg.payload.toLowerCase();
      send(msg);

      if (done) {

      } else if (err) {
        if (done) {
          // Node-RED 1.0 compatible
          done(err);
        } else {
          // Node-RED 0.x compatible
          node.error(err, msg);
        }
      }
    });
  }

  RED.nodes.registerType("signal-filter", signalFilter);
}
