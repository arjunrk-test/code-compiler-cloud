"use client";
import Split from "react-split";
import CodeEditor from "./CodeEditor";
import InputWindow from "./InputWindow";
import OutputWindow from "./OutputWindow";

const EditorLayout = ({ theme, selectedLanguage, code, inputText, setInputText, output, setCode }) => {
  return (
    <div className="h-[calc(100vh-50px)]">
      <Split
        className="flex h-full bg-gutterBg"
        sizes={[60, 40]}
        minSize={300}
        gutterSize={5}
        gutter={(index, direction) => {
          const gutter = document.createElement("div");
          gutter.className = `gutter ${direction === "vertical" ? "gutter-vertical" : "gutter-horizontal"}`;
          return gutter;
        }}
      >
        <CodeEditor theme={theme} language={selectedLanguage} code={code} setCode={setCode} />
        <Split
          direction="vertical"
          sizes={[50, 50]}
          minSize={100}
          gutterSize={5}
          gutter={(index, direction) => {
            const gutter = document.createElement("div");
            gutter.className = `gutter ${direction === "vertical" ? "gutter-vertical" : "gutter-horizontal"}`;
            return gutter;
          }}
        >
          <InputWindow theme={theme} inputText={inputText} setInputText={setInputText} />
          <OutputWindow theme={theme} output={output} />
        </Split>
      </Split>
    </div>
  );
};

export default EditorLayout;
