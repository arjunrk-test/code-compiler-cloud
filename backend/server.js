const express = require('express');
const axios = require('axios');
const cors = require('cors');

const app = express();
const PORT = 3001;

// app.use(cors({
//   origin: "https://code-compiler-next.vercel.app", 
//   methods: ["POST", "GET"], 
//   credentials: true
// })); 

// app.use((req, res, next) => {
//   res.header("Access-Control-Allow-Origin", "https://code-compiler-next.vercel.app");
//   res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
//   res.header("Access-Control-Allow-Headers", "Content-Type, Authorization");
//   next();
// });

// app.options("/api/run-code", (req, res) => {
//   res.header("Access-Control-Allow-Origin", "https://code-compiler-next.vercel.app");
//   res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
//   res.header("Access-Control-Allow-Headers", "Content-Type, Authorization");
//   res.sendStatus(200);
// });

app.use(cors());
app.use(express.json());

app.post('/api/run-code', async (req, res) => {
  const { language, version, code, stdin } = req.body;
  const API = axios.create({
    baseURL: "https://emkc.org/api/v2/piston",
  });

  try {
    const response = await API.post('/execute', {
      language: language,
      version: version,
      files: [
        { name: "main", content: code }
      ],
      stdin: stdin,
    });
    res.status(200).json(response.data);
  } catch (error) {
    console.error("Code execution failed:", error.response ? error.response.data : error.message);
    res.status(500).json({ error: "Code execution failed", details: error.response ? error.response.data : error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});