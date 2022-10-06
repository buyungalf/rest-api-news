var express = require("express");
var router = express.Router();
var bcrypt = require("bcryptjs");

const db = require("../models");
const Users = db.users;
const Op = db.Sequelize.Op;

const config = require("../config");
const jwt = require("jsonwebtoken");

//register post
router.post("/register", function (req, res, next) {
  var password_hash = bcrypt.hashSync(req.body.password, 8);
  var user = {
    nama: req.body.nama,
    email: req.body.email,
    username: req.body.username,
    password: password_hash,
  };
  Users.create(user)
    .then(() => {
      res.json({
        status: "success",
        message: "Register success!",
      });
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

router.post("/login", function (req, res, next) {
  //   var password_hash = bcrypt.compareSync(req.body.password, hash);
  Users.findOne({
    where: { username: req.body.username },
  })
    .then((data) => {
      if (data) {
        var valid = bcrypt.compareSync(req.body.password, data.password);
        if (valid) {
          var payload = {
            id: data.id,
            username: req.body.username,
          };

          let token = jwt.sign(payload, config.secret, {
            expiresIn: "1d",
          });
          let dt = new Date();
          dt.setHours(dt.getHours() + 3);
          res.json({
            success: true,
            token: token,
            expired: dt.toLocaleDateString() + " " + dt.toLocaleTimeString(),
          });
        } else {
          res.status(404).send({
            msg: "Password salah",
          });
        }
      } else {
        res.status(404).send({
          msg: "Password salah",
        });
      }
    })
    .catch((err) => {
      res.json({
        info: "Login Error",
        message: err.message,
      });
    });
});

// logout
router.get("/logout", function (req, res, next) {
  req.session.destroy();
  res.json({
    msg: "Logout success",
  });
});

module.exports = router;
