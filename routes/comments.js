const express = require("express");
const { Sequelize } = require("../models");
const router = express.Router();

const db = require("../models");
const Comments = db.comments;
const Op = db.Sequelize.Op;

//comments
router.get("/", function (req, res, next) {
  Comments.findAll()
    .then((data) => {
      res.json({ data });
    })
    .catch((err) => {
      res.json({
        info: "Error",
        msg: err,
      });
    });
});

router.get("/:id", function (req, res, next) {
  var id = req.params.id;
  Comments.findAll({ where: { newsId: id } })
    .then((data) => {
      res.json({ data });
    })
    .catch((err) => {
      res.json({
        info: "Error",
        msg: err,
      });
    });
});

router.post("/", function (req, res, next) {
  var comment = {
    newsId: req.body.newsId,
    name: req.body.name,
    comments: req.body.comments,
  };
  Comments.create(comment)
    .then((data) => {
      res.json({ msg: "Success!", data: data });
    })
    .catch((err) => {
      res.json({ info: "Error", msg: err });
    });
});

module.exports = router;
