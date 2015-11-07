nedb = require 'nedb'
db = new nedb { filename: './db/changes', autoload: true }

express = require 'express'
router = express.Router()

router.get '/', (req, res) ->
  db.find { fixed: { $exists: false } }, (err, docs) ->
    unless err?
      res.json docs
    else
      res.json err

router.post '/', (req, res) ->
  db.insert req.body
  res.json req.body

router.post '/:id/done', (req, res) ->
  db.update { _id: req.params.id }, { $set: { fixed: true } }
  res.sendStatus 200

module.exports = router