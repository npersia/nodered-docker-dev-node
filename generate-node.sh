NODE=lower-case

mkdir nodes/$NODE

echo "<script type=\"text/javascript\">
    RED.nodes.registerType('$NODE',{
        category: 'function',
        color: '#a6bbcf',
        defaults: {
            name: {value:\"\"}
        },
        inputs:1,
        outputs:1,
        icon: \"file.png\",
        label: function() {
            return this.name||\"$NODE\";
        }
    });
</script>

<script type=\"text/x-red\" data-template-name=\"$NODE\">
    <div class=\"form-row\">
        <label for=\"node-input-name\"><i class=\"icon-tag\"></i> Name</label>
        <input type=\"text\" id=\"node-input-name\" placeholder=\"Name\">
    </div>
</script>

<script type=\"text/x-red\" data-help-name=\"$NODE\">
    <p>A simple node that converts the message payloads into all $NODE characters</p>
</script>" > nodes/$NODE/$NODE.html



echo "module.exports = function(RED) {
    function NodeExample(config) {
        RED.nodes.createNode(this,config);
        var node = this;
        node.on('input', function(msg) {
            msg.payload = msg.payload.toLowerCase();
            node.send(msg);
        });
    }
    RED.nodes.registerType(\"$NODE\",NodeExample);
}" > nodes/$NODE/$NODE.js



echo "{
  \"name\": \"node-red-contrib-$NODE\",
  \"version\": \"1.0.0\",
  \"description\": \"\",
  \"main\": \"$NODE.js\",
  \"scripts\": {
    \"test\": \"echo \\\"Error: no test specified\\\" && exit 1\"
  },
  \"node-red\" : {
        \"nodes\": {
            \"$NODE\": \"$NODE.js\"
        }
    },
  \"author\": \"\",
  \"license\": \"ISC\"
}" > nodes/$NODE/package.json
