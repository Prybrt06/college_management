import React, { useState } from "react";
import { useHistory } from "react-router-dom";
import "./css/login.css";

const Login = () => {
	const [password, setPassword] = useState("");
	const history = useHistory();

	const handlePasswordChange = (e) => {
		setPassword(e.target.value);
	};

	const handleSubmit = (e) => {
		e.preventDefault();

		// Check if the entered password is '1234'
		if (password === "102938") {
			// Redirect to the home page
			history.push("/home");
		} else {
			alert("Incorrect password. Please try again.");
		}
	};

	return (
		<div style={{marginLeft: "38%", marginTop: "20%"}}>
			<h1>Password Form</h1>
			<form onSubmit={handleSubmit}>
				<label>
					Password:
					<input
						type="password"
						value={password}
						onChange={handlePasswordChange}
					/>
				</label>
				<button type="submit">Submit</button>
			</form>
		</div>
	);
};

export default Login;
