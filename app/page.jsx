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
        const response = await axios.post(`http://localhost:20000/api/execute/${selectedLanguage}`, {
            language: selectedLanguage,
            code: code,
            stdin: inputText,
        });

        if (response.data) {
            setOutput(response.data);
        }else {
          setOutput("No output received.");
      }
    } catch (error) {
        if (error.response && error.response.data) {
            setOutput(error.response.data);
        } else {
            setOutput("Execution error: " + (error.message || "Unknown error"));
        }
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
