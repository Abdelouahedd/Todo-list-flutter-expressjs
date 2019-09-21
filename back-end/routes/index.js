var express = require('express');
var router = express.Router();
var MongoClient = require('mongodb').MongoClient;
const ObjectId = require('mongodb').ObjectId;
var url = "mongodb://localhost:27017/todos";
var db;

MongoClient.connect(url, { useNewUrlParser: true })
  .then(client => {
    db = client.db('todos');
  }).catch(error => console.error(error));


router.post('/addTask', (req, res) => {
  var myobj = JSON.parse(req.body.todo)
  console.log(myobj)

  db.collection("task").save(myobj, function (err) {
    if (err) throw err;
    res.json("1 document inserted");
  });

});

router.get('/allTodos', (req, res) => {
  db.collection("task").find({}).toArray(function (err, result) {
    if (result.lenght !== 0) res.json(result);
    else res.json("User not found");
  });
});

router.delete('/delTask/:id', (req, res) => {

  db.collection('task').deleteOne({ _id: ObjectId(req.params.id) }, (err) => {
    if (err) {
      res.send(err);
    }
    res.json({ success: true, msg: "task removed by succesfully" });
  })
});


router.delete('/deleteAll', (req, res) => {
  db.collection('task').deleteMany((err) => {
    if (err) {
      res.send(err);
    }
    res.json({ success: true, msg: "all tasks removed by succesfully" });
  })
});


router.put('/upTask/:id', (req, res) => {
  var obj = JSON.parse(req.body.todo)
  console.log(obj)
  var myquery = { _id: ObjectId(req.params.id) };
  var newTask = { $set: { time: Date.now(), done: obj.done } };
  db.collection("task").updateOne(myquery, newTask, function (err) {
    if (err) throw err;
    res.json({ success: true, msg: newTask });
  });
});


module.exports = router;
