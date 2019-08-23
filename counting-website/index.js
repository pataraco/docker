// displays/counts visits to the website using redis
const express = require('express');
const redis = require('redis');
const process = require('process');
const app = express();
const client = redis.createClient({
  host: 'redis-server',
  port: 6379
});
const port = 8082;
client.set('visits', 0);

app.get('/', (req, res) => {
  // process.exit(1);  // for debugging/testing
  client.get('visits', (err, visits) => {
    client.set('visits', parseInt(visits) + 1);
    res.send('Number of visits: [' + visits + ']');
  });
});

app.listen(8082, () => {
  console.log('Listening on port 8082');
});
