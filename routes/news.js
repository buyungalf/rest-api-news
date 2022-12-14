const express = require("express");
const { Sequelize } = require("../models");
const router = express.Router();

const db = require("../models");
const passport = require("passport");
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

router.get(
  "/deleted",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    News.findAll({
      where: { destroyTime: { [Op.not]: null } },
      paranoid: false,
    })
      .then((data) => {
        res.json({ data });
      })
      .catch((err) => {
        res.json({
          info: "Error",
          msg: err,
        });
      });
  }
);

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

router.post(
  "/",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    if (!req.file) {
      res.json({ msg: "Image not found" });
    }
    var news = {
      title: req.body.title,
      content: req.body.content,
      thumbnail: req.file.path,
      author: req.body.author,
    };
    News.create(news)
      .then((data) => {
        res.json({ data });
      })
      .catch((err) => {
        res.json({ info: "Error", msg: err });
      });
  }
);
//update
router.put(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
    const id = req.params.id;
    let news = {};
    if (!req.file) {
      news = {
        title: req.body.title,
        content: req.body.content,
        author: req.body.author,
      };
    } else {
      news = {
        title: req.body.title,
        content: req.body.content,
        thumbnail: req.file.path,
        author: req.body.author,
      };
    }
    News.update(news, {
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
  }
);

//delete
router.delete(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  function (req, res, next) {
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
  }
);

module.exports = router;
