"use client";
import { useState, useEffect } from "react";
import axios from 'axios';
import Navbar from "@/components/Navbar";
import EditorLayout from "@/components/EditorLayout";
import { Code_Snippets, Language_Versions } from "@/app/Constants";

export default function Home() {
  const [theme, setTheme] = useState("dark");
  const [selectedLanguage, setSelectedLanguage] = useState("bash");
  const [code, setCode] = useState(Code_Snippets["bash"]);
  const [inputText, setInputText] = useState("");
  const [output, setOutput] = useState("");

  useEffect(() => {
    const savedTheme = localStorage.getItem("theme");
    if (savedTheme) {
      setTheme(savedTheme);
      document.documentElement.classList.toggle("light", savedTheme === "light");
    }
  }, []);

  const handleThemeClick = () => {
    const newTheme = theme === "dark" ? "light" : "dark";
    setTheme(newTheme);
    localStorage.setItem("theme", newTheme);
    document.documentElement.classList.toggle("light", newTheme === "light");
  };

  const handleLanguageChange = (newLanguage) => {
    setSelectedLanguage(newLanguage);
    setCode(Code_Snippets[newLanguage] || ""); 
  };

  const handleRunCode = async () => {
    try {
      const response = await axios.post('http://localhost:3001/api/run-code', {
        language: selectedLanguage,
        version: Language_Versions[selectedLanguage],
        code: code,
        stdin: inputText,
      });
      const errorMessage = response.data.run?.stderr || response.data.stderr || response.data.compile?.stderr;
      if(errorMessage){
        setOutput("Error: \n" + errorMessage);
      }else{
        setOutput(response.data.run.stdout || "No output");
      }
    } catch (error) {
      setOutput("Execution error: " + (error.response?.data?.error || error.message || "Unknown error"));
    }
  };

  return (
    <>
      <Navbar 
        theme={theme} 
        handleThemeClick={handleThemeClick} 
        selectedLanguage={selectedLanguage} 
        onLanguageChange={handleLanguageChange}
        handleRunCode={handleRunCode}
      />
      <EditorLayout 
        theme={theme} 
        selectedLanguage={selectedLanguage} 
        code={code} 
        setCode={setCode}
        inputText={inputText}
        setInputText={setInputText}
        output={output}
      />
    </>
  );
}
