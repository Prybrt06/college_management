exports.getAllCourse = async (req,res) => {
    const connection = req.app.get("connection");
	const [rows, fields] = await connection.query(
		"SELECT c.course_name, c.credits, d.dname, f.fname FROM course AS c INNER JOIN department AS d ON c.did = d.did INNER JOIN faculty AS f ON c.did = f.did;"
	);
	// console.log(rows);
	res.status(200).json(rows);
}

exports.getCourseCount = async (req,res) => {
    console.log("fhjklashdf ljhajklfhalkfhjl");
    const connection = req.app.get("connection");
    const [rows] = await connection.query(
		"SELECT COUNT(courseid) AS noOfCourses FROM course"
	);
    
    console.log("dkfhlafdhjklafjklahfjklhfljk");
    console.log(rows);
    res.status(200).json(rows[0]);
}