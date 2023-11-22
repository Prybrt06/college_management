import React, { useState, useEffect } from "react";
import { Col, Row } from "react-bootstrap";
import _ from "lodash";
import libraryLogo from "../images/library-lg.png";
import switchOrder from "../images/switch-order-logo.png";
import course from "../images/book.png";
import { Link } from "react-router-dom";

function Course() {
	const [tag, setTag] = useState("bname");
	const [order, setOrder] = useState("1");
	const [noOfCourses, setCourseNo] = useState(0);
	const [noOfAuthors, setAuthorNo] = useState(0);
	const [noOfEditions, setEditionNo] = useState(0);
	const [courses, setCourses] = useState([]);
	const [searchVal, setSearchVal] = useState("");

	async function getCount() {
		try {
			const doc = await fetch("/api/course/get/course/count");
			const { noOfCourses} = await doc.json();
            console.log(noOfCourses);
			setCourseNo(noOfCourses);
		} catch (err) {
			console.log(err);
		}
	}

	async function getCourses() {
		try {
			const doc = await fetch(`/api/course/get/course`);
			const courses = await doc.json();
            // console.log(courses);
			setCourses(courses);
		} catch (err) {
			console.log(err);
		}
	}

	const handleChange = (e) => {
		setSearchVal(e.target.value);
	};

	const handleSubmit = async (e) => {
		e.preventDefault();
		if (searchVal !== "") {
			const doc = await fetch(
				`/api/library/search?tag=${tag}&filter=${searchVal}`
			);
			const result = await doc.json();
			setCourses(result);
		} else {
			const doc = await fetch(`/api/library?tag=bname`);
			const result = await doc.json();
			setCourses(result);
		}
	};
	const handleKeyDown = async (e) => {
		if (e.code === "Enter" || e.code === "NumpadEnter") handleSubmit(e);
	};

	const handleOrder = (e) => {
		e.preventDefault();
		if (order === "1") setOrder("-1");
		else setOrder("1");
	};

	const handleDelete = async (el) => {
		try {
			await fetch(
				`api/library/delete?bname=${el.bname}&edition=${el.edition}`,
				{
					method: "POST",
				}
			);
			const updatedCourses = _.remove(courses, function (n) {
				return n.bname === el.bname;
			});
			setCourses(updatedCourses);
		} catch (err) {}
	};

	useEffect(() => {
		getCount();
		if (searchVal === "") getCourses();
	}, [tag, order, noOfCourses, noOfAuthors, noOfEditions, courses.length]);
	console.log(searchVal);
	return (
		<div>
			<Row>
				<Col className="leftside" md={2}>
					<p>
						<span
							className="pageimageholder"
							style={{ marginTop: "40px", border: "1px solid" }}
						>
							<img
								style={{ marginTop: "40px" }}
								src={libraryLogo}
								alt=""
							/>
						</span>
					</p>
					<p className="page-title">COURSE</p>
					<p>
						No. of courses: <b>{noOfCourses}</b> <br></br>
					</p>
					<br></br>
					{/* <Link to="/library/add">
						<button
							className="add-btn"
							style={{ border: "1px solid" }}
						>
							<i class="fa fa-plus mr-3" aria-hidden="true"></i>
							Add Course
						</button>
					</Link> */}
				</Col>
				{/* <Col md={1}></Col> */}
				<Col className="rightside" md={8}>
					{/* MAIN */}
					<Row
						className="homerow justify-content-md-center"
						style={{ marginBottom: "3rem" }}
					>
						{courses.length > 0 &&
							courses.map((el, id) => (
								<Col
									md={5}
									key={id}
									className="pagegrid"
									style={{ border: "1px solid", height: "15rem" }}
								>
									<Row>
										<Col md={1}>
											<span>
												<img
													style={{
														marginTop: "30px",
													}}
													src={course}
													alt=""
												/>
											</span>
										</Col>
										<Col>
											<br></br>
											{/* <p className="float-right">
												<Link
													to={`/library/update/${el.courseid}`}
												>
													<i
														class="fa fa-pencil mr-3"
														aria-hidden="true"
													/>
												</Link>
												<i
													class="fa fa-trash"
													aria-hidden="true"
													onClick={() =>
														handleDelete(el)
													}
												/>
											</p> */}
											<p className="grid-title ">
												{el.course_name}
											</p>
                                            <p>
                                                - {el.fname}
                                            </p>
											<span style={{ float: "right" }}>
												{" "}
												Credits : {el.credits}
											</span>
										</Col>
									</Row>
                                    <br />
                                    <p>{el.dname}</p>
								</Col>
							))}
					</Row>
				</Col>
			</Row>
		</div>
	);
}

export default Course;
