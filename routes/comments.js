const express = require("express");
const { Sequelize } = require("../models");
const router = express.Router();

const db = require("../models");
const Comments = db.comments;
const Op = db.Sequelize.Op;

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
  News.findByPk(req.params.id)
    .then((data) => {
      res.json({ data });
    })
    .catch((err) => {
      res.json({ info: "Error", msg: err });
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
      res.json({ data });
    })
    .catch((err) => {
      res.json({ info: "Error", msg: err });
    });
});

//delete
router.delete("/:id", function (req, res, next) {
  const id = req.params.id;
  Comments.destroy({
    where: { id: id },
  })
    .then((num) => {
      if (num > 0) {
        res.send({
          msg: "Delete success!",
        });
      } else {
        res.status(404).send({
          msg: "Delete failed",
        });
      }
    })
    .catch((err) => {
      res.json({
        info: "Error",
        message: err.message,
      });
    });
});

module.exports = router;
