var express = require('express');
var createCourse = require('../controllers/course');

const router = express.Router();
router.post('/courses', createCourse);

module.exports = router;
