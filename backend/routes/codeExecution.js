const express = require("express");
const { exec } = require("child_process");
const router = express.Router();
const fs = require("fs");
const path = require("path");

function escapeShellArg(code) {
    return code.replace(/'/g, "'\\''"); // Escape single quotes
}

// Bash Execution
router.post("/execute/bash", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).json({ error: "No code provided" });
    }
    const command = `docker run --rm -e CODE='${code}' bash-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(500).json({ error: stderr || "Execution failed" });
        }
        res.json({ output: stdout.trim() });
    });
});

//C execution
router.post("/execute/c", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).json({ error: "No code provided" });
    }
    const command = `docker run --rm -e CODE='${code}' c-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(500).json({ error: stderr || "Execution failed" });
        }
        res.json({ output: stdout.trim() });
    });
});

//C++ execution
router.post("/execute/cpp", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).json({ error: "No code provided" });
    }
    const command = `docker run --rm -e CODE='${code}' cpp-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(500).json({ error: stderr || "Execution failed" });
        }
        res.json({ output: stdout.trim() });
    });
});

//C# execution
router.post("/execute/csharp", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).json({ error: "No code provided" });
    }
    const command = `docker run --rm -e CODE='${code}' csharp-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(500).json({ error: stderr || "Execution failed" });
        }
        res.json({ output: stdout.trim() });
    });
});

//Java Execution
router.post("/execute/java", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).send("No code provided");
    }
    const filePath = path.join(__dirname, "Main.java");
    fs.writeFileSync(filePath, code);
    const command = `docker run --rm -v ${filePath}:/home/app/Main.java java-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(400).send(stderr || "Syntax error in the code.");
        }
        res.send(stdout.trim());
    });
});

//Javascript execution
router.post("/execute/javascript", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).send("No code provided");
    }
    const filePath = path.join(__dirname, "script.js");
    fs.writeFileSync(filePath, code);
    const command = `docker run --rm -v ${filePath}:/home/app/script.js javascript-executor`;
    exec(command, (error, stdout, stderr) => {
        if (stderr) {
            return res.status(400).send(stderr.trim()); 
        }
        if (error) {
            return res.status(400).send(error.message || "Syntax error in the code.");
        }
        res.send(stdout.trim());
    });
});

//Kotlin execution
router.post("/execute/kotlin", (req, res) => {
    const { code } = req.body;
    if (!code) return res.status(400).json({ error: "No code provided" });
    const command = `docker run --rm -e CODE='${escapeShellArg(code)}' kotlin-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) return res.status(500).json({ error: stderr || "Execution failed" });
        res.json({ output: stdout.trim() });
    });
});

//Perl execution
router.post("/execute/perl", (req, res) => {
    const { code } = req.body;
    if (!code) return res.status(400).json({ error: "No code provided" });
    const command = `docker run --rm -e CODE='${escapeShellArg(code)}' perl-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) return res.status(500).json({ error: stderr || "Execution failed" });
        res.json({ output: stdout.trim() });
    });
});

//PHP execution
router.post("/execute/php", (req, res) => {
    const { code } = req.body;
    if (!code) return res.status(400).json({ error: "No code provided" });
    const command = `docker run --rm -e CODE='${escapeShellArg(code)}' php-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) return res.status(500).json({ error: stderr || "Execution failed" });
        res.json({ output: stdout.trim() });
    });
});

// Python execution
router.post("/execute/python", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).send("No code provided");
    }
    const filePath = path.join(__dirname, "script.py");
    fs.writeFileSync(filePath, code);
    const command = `docker run --rm -v ${filePath}:/home/app/script.py python-executor`;
    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(400).send(stderr || "Syntax error in the code.");
        }
        res.send(stdout.trim());
    });
});

// Ruby execution
router.post("/execute/ruby", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).json({ error: "No code provided" });
    }
    const command = `docker run --rm -e CODE='${escapeShellArg(code)}' ruby-executor`;
    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(500).json({ error: stderr || "Execution failed" });
        }
        res.json({ output: stdout.trim() });
    });
});

// Rust execution
router.post("/execute/rust", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).json({ error: "No code provided" });
    }
    const command = `docker run --rm -e CODE='${escapeShellArg(code)}' rust-executor`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            return res.status(500).json({ error: stderr || "Execution failed" });
        }
        res.json({ output: stdout.trim() });
    });
});

// Swift execution
router.post("/execute/swift", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).send("No code provided");
    }
    const filePath = path.join(__dirname, "main.swift");
    fs.writeFileSync(filePath, code);
    const command = `docker run --rm -v ${filePath}:/home/app/main.swift swift-executor`;
    exec(command, (error, stdout, stderr) => {
        if (stderr) {
            return res.status(400).send(stderr.trim()); 
        }
        if (error) {
            return res.status(400).send(error.message || "Syntax error in the code.");
        }
        res.send(stdout.trim());
    });
});

// TypeScript execution
router.post("/execute/typescript", (req, res) => {
    const { code } = req.body;
    if (!code) {
        return res.status(400).send("No code provided");
    }
    const filePath = path.join(__dirname, "script.ts");
    fs.writeFileSync(filePath, code);
    const command = `docker run --rm -v ${filePath}:/home/app/script.ts typescript-executor`;
    exec(command, (error, stdout, stderr) => {
        if (stderr) {
            return res.status(400).send(stderr.trim()); 
        }
        if (error) {
            return res.status(400).send(error.message || "Syntax error in the code.");
        }
        res.send(stdout.trim());
    });
});

module.exports = router;
