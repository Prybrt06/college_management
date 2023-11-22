import React from "react";
import nitsCampus from "../images/nits.png";

function About() {
	return (
		<div style={{ textAlign: "center" }}>
			<br></br>
			<h2>About us</h2>
			<br></br>
			<div style={{ width: "1300px" }} className="center-div">
				<div className="row">
					<div className="col-6">
						<p className="  ">
							Team no : 18
							<br />
							<br />
							<h2>Team member</h2>
							Adarsh Kumar : 2112187
							<br />
							Spandan Priyam Chetia : 2112188
							<br />
							Nabarun Kalita : 2112189
							<br />
							Priyabrat Duarah : 2112190
							<br />
						</p>
					</div>
					<div className="align-self-end col-6">
						<img src={nitsCampus} alt="" width={500}/>
					</div>
				</div>
			</div>
		</div>
	);
}

export default About;
