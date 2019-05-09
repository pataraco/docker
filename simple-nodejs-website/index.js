const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
  res.send('Raco was here... cheers..');
});

app.listen(8080, () => {
  console.log('Listening on port 8080');
});
