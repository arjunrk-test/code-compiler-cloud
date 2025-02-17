const express = require("express");
const { exec } = require("child_process");
const router = express.Router();

const languages = {
    bash: { filename: "script.sh", executor: "bash-executor" },
    c: { filename: "main.c", executor: "c-executor" },
    cpp: { filename: "main.cpp", executor: "cpp-executor" },
    csharp: { filename: "Test.cs", executor: "csharp-executor" },
    java: { filename: "Main.java", executor: "java-executor" },
    javascript: { filename: "script.js", executor: "javascript-executor" },
    kotlin: { filename: "Main.kt", executor: "kotlin-executor" },
    perl: { filename: "script.pl", executor: "perl-executor" },
    php: { filename: "script.php", executor: "php-executor" },
    python: { filename: "script.py", executor: "python-executor" },
    ruby: { filename: "script.rb", executor: "ruby-executor" },
    rust: { filename: "main.rs", executor: "rust-executor" },
    swift: { filename: "main.swift", executor: "swift-executor" },
    typescript: { filename: "script.ts", executor: "typescript-executor" }
};

const executeCode = (language, code, stdin, res) => {
    const encodedCode = Buffer.from(code).toString('base64');
    const encodedInput = stdin ? Buffer.from(stdin).toString('base64') : null;

    if (!code) {
        return res.status(400).send("No code provided");
    }

    const langConfig = languages[language];
    if (!langConfig) {
        return res.status(400).send("Unsupported language");
    }

    const command = stdin
        ? `docker run --rm -i -e CODE=${encodedCode} -e INPUT=${encodedInput} ${langConfig.executor}`
        : `docker run --rm -i -e CODE=${encodedCode} ${langConfig.executor}`;

    exec(command, (error, stdout, stderr) => {
        if (stderr) {
            return res.status(400).send(stderr.trim());
        }
        res.send(stdout.trim());
    });
};

Object.keys(languages).forEach((language) => {
    router.post(`/execute/${language}`, (req, res) => {
        executeCode(language, req.body.code, req.body.stdin, res);
    });
});

module.exports = router;