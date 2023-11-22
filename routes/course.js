const { Router } = require("express");
const { getAllCourse, getCourseCount } = require("../controllers/course");

const router = Router();

router.get("/get/course", getAllCourse);
router.get("/get/course/count", getCourseCount);

module.exports = router;
