const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

//app.get("/", (req, res) => {
//    res.send("Hello from Jira Demo App!");
//
//});

app.get('/', (req, res) => {
  res.send('Welcome to the Homepage!');
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
