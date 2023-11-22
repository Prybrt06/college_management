import React, { Component } from "react";
import { Col, Row } from "react-bootstrap";
import home from "../images/home.png";
import phone from "../images/phone.png";
import fax from "../images/fax.png";
import email from "../images/emil.png";
import website from "../images/website.png";

class Contact extends Component {
	render() {
		return (
			<div>
				<Row>
					<Col md={1}></Col>
					<Col>
						<br></br>
						<br></br>
						<br></br>
						<br></br>
						<br></br>
						<br></br>
						<br></br>
						<br></br>
						<br></br>

						<Row>
							<Col md={3}>
								{" "}
								<img className="mr-2" src={home} alt="" />
								<b className="mt-2"> Address: </b>{" "}
							</Col>
							<Col>
								NIT Silchar
								<br />
								Dist: Cachar
								<br />
								State : Assam
								<br />
								Pin : 788010
							</Col>
						</Row>
						<br></br>
						<Row>
							<Col md={3}>
								{" "}
								<img className="mr-2" src={phone} alt="" />
								<b className="mt-2"> Phone: </b>{" "}
							</Col>
							<Col>
								+91-6200737363
								<br />
								+91-7896292687
								<br />
								+91-9401012205
								<br />
								+91-7086866074
								<br />
							</Col>
						</Row>
						<br></br>
						<Row>
							<Col md={3}>
								{" "}
								<img className="mr-2" src={email} alt="" />
								<b className="mt-2"> Email: </b>{" "}
							</Col>
							<Col>
								adarsh21_ug@cse.nits.ac.in
								<br />
								spandan21_ug@cse.nits.ac.in
								<br />
								nabarun21_ug@cse.nits.ac.in
								<br />
								priyabrat21_ug@cse.nits.ac.in
							</Col>
						</Row>
						<br></br>
					</Col>
					<Col md={1}></Col>
				</Row>
			</div>
		);
	}
}

export default Contact;
