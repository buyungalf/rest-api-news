var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");

var indexRouter = require("./routes/index");
var usersRouter = require("./routes/users");
var newsRouter = require("./routes/news");
var commentsRouter = require("./routes/comments");

var app = express();

const db = require("./models");
db.sequelize
  .sync()
  .then(() => {
    console.log("db sync success!");
  })
  .catch((err) => {
    console.log(err.message);
  });

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/users", usersRouter);
app.use("/api/v1/news", newsRouter);
app.use("/api/v1/comments", commentsRouter);

module.exports = app;
