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
      var taginfo = globalContext.get("taginfo");
      // console.log(taginfo);

      if (taginfo === undefined) {
        return;
      }

      // console.log(config.tag);
      // console.log(taginfo.Data);
      var tagvalue = JSON.parse(msg.payload);
      // console.log(tagvalue.Data.length);

      if (tagvalue.Data.length > 0) {
        var findTag = taginfo.Data.find(x => x.TAG_NAME == config.tag || x.TAG_ID == config.tag);
        if (findTag === undefined) {
          return;
        }
        // console.log(findTag);

        var findValue = tagvalue.Data.find(x => x.TAG_NAME == config.tag || x.TAG_ID == config.tag);
        if (findValue === undefined) {
          return;
        }
        // console.log(findValue);

        findTag.TIMESTAMP = findValue.TIMESTAMP;
        findTag.DATETIME = findValue.DATETIME;
        findTag.SENSOR = findValue.SENSOR;
        findTag.VALUE = findValue.VALUE;
        findTag.QUALITY = findValue.QUALITY;

        if (config.field == 'ALL') {
          msg.payload = findTag;
        } else {
          msg.payload = findTag[`${config.field}`];
        }

        send(msg);
      }
    });
  }

  RED.nodes.registerType("signal-filter", signalFilter);
}
