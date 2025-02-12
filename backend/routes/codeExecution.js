const express = require("express");
const { exec } = require("child_process");

const router = express.Router();

router.post("/execute/java", (req, res) => {
    const { code } = req.body;
    
    if (!code) {
        return res.status(400).json({ error: "No code provided" });
    }

    // Command to run Java executor container with user code
    const command = `docker run --rm -e CODE='${code}' java-executor`;
    console.log("Executing command:", command);

    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(500).json({ error: stderr || "Execution failed" });
        }
        res.json({ output: stdout.trim() });
    });
});

module.exports = router;
