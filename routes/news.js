const express = require("express");
const { Sequelize } = require("../models");
const router = express.Router();

const db = require("../models");
const News = db.news;
const Comments = db.comments;
const Op = db.Sequelize.Op;

router.get("/", function (req, res, next) {
  News.findAll()
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
      Comments.findAll({
        attributes: ["id", "name", "comment", "createdAt"],
        where: { newsId: req.params.id },
      })
        .then((comments) => {
          res.json({ news: data, comments: comments });
        })
        .catch((err) => {
          res.json({ info: "Error", msg: err });
        });
    })
    .catch((err) => {
      res.json({ info: "Error", msg: err });
    });
});

router.post("/", function (req, res, next) {
  var news = {
    title: req.body.title,
    content: req.body.content,
    thumbnail: req.body.thumbnail,
    author: req.body.author,
  };
  News.create(news)
    .then((data) => {
      res.json({ data });
    })
    .catch((err) => {
      res.json({ info: "Error", msg: err });
    });
});
//update
router.put("/:id", function (req, res, next) {
  const id = req.params.id;
  News.update(req.body, {
    where: { id: id },
  })
    .then((num) => {
      if (num > 0) {
        res.send({
          msg: "Update success!",
        });
      } else {
        res.status(404).send({
          msg: "Update failed",
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

//delete
router.delete("/:id", function (req, res, next) {
  const id = req.params.id;
  News.destroy({
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
