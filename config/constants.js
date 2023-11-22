const dotEnv = require('dotenv');

dotEnv.config();

const config = {
	port: 8080,
	host: "localhost",
	user: "root",
	password: "@540Sintu",
	database: "college_mgmt",
};

module.exports = config;