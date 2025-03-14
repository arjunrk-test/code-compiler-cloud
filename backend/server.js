const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const PORT = 20000;
const codeExecutionRoutes = require("./routes/codeExecution");

const app = express();

app.use(cors());
app.use(bodyParser.json());

// Use the execution route
app.use("/api", codeExecutionRoutes);

// const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
