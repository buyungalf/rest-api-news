"use strict";

const passport = require("passport");
var JwtStrategy = require("passport-jwt").Strategy,
  ExtractJwt = require("passport-jwt").ExtractJwt;

const db = require("../models");
const Users = db.users;

var config = require("../config");
var opts = {};

opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = config.secret;

passport.use(
  new JwtStrategy(opts, function (jwt_payload, done) {
    Users.findByPk(jwt_payload.id)
      .then((data) => {
        if (data) {
          return done(null, data);
        } else {
          return done("user not found", false);
        }
      })
      .catch((err) => {
        res.json({
          info: "Error",
          message: err.message,
        });
      });
  })
);
