import React, { Component } from "react";
import Navbar from "react-bootstrap/Navbar";
import logo from "../images/djs.png";
import Nav from "react-bootstrap/Nav";
import { Link } from "react-router-dom";

class TopNav extends Component {
	render() {
		return (
			<Navbar bg="dark" variant="dark" style={{ maxHeight: "60px" }}>
				<Link to="/home">
					<Navbar.Brand href="#home" className="navtitle">
						<img src={logo} width={50} />
					</Navbar.Brand>
				</Link>

				<Nav className="mr-auto"></Nav>
				<div class="nav-item dropdown ">
					<button
						class="btn btn-transparent"
						id="navbarDropdown"
						data-toggle="dropdown"
						aria-haspopup="true"
						aria-expanded="false"
					>
						<i
							style={{ color: "white", fontSize: "23px" }}
							class="fa fa-bars"
							aria-hidden="true"
						></i>
					</button>
					<div
						class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdown"
					>
						<Link class="dropdown-item" to="/departments">
							Departments
						</Link>
						<Link class="dropdown-item" to="/library">
							Library
						</Link>
						<Link class="dropdown-item" to="/projects">
							Projects
						</Link>
						<Link class="dropdown-item" to="/course">
							Courses
						</Link>
					</div>
				</div>
				{/* <Form inline>
            <button className="login-btn">Log In</button>
          </Form> */}
			</Navbar>
		);
	}
}

export default TopNav;
