module.exports = function (RED) {
  // const request = require('request');

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

  // $.getJSON("/tags", function (data) {
  //   console.log(data);
  // });

  function signalFilter(config) {
    const node = this;
    RED.nodes.createNode(node, config);

    var globalContext = this.context().global;
    // console.log(globalContext);

    node.on('input', function (msg, send, done) {
      var tags = globalContext.get("tags");
      // console.log(tags);

      // console.log(`TagName: ${config.tag}, Field: ${config.field}`);
      var data = msg.payload;
      // console.log(data);
      if (data.length > 0) {
        var findTag = data.find(x => x.TagName == config.tag);
        // console.log(filtered);
        if (findTag != null) {
          if (config.field == 'All') {
            msg.payload = findTag;
          } else {
            msg.payload = findTag[`${config.field}`];
          }
          send(msg);
        }
      }
    });
  }

  RED.nodes.registerType("signal-filter", signalFilter);
}
