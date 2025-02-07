import React from "react";
import { Editor } from "@monaco-editor/react";

const OutputWindow = ({ theme, output }) => {
  return (
      <div className={`bg-${theme === "dark" ? "[#1E1E1E]" : "white"} text-black h-full flex flex-col`}>
  
        {/* Navbar inside the input window */}
        <div className="bg-miniNavBg flex items-center text-sm">
          <div className="bg-miniBoxBg text-miniBoxTx py-[1px] px-6">Output</div>
        </div>
  
        {/* Monaco Editor Input Window */}
        <div className="relative flex-1 overflow-hidden">
          <Editor
            height="100%" 
            key={output}
            language="text/plain"
            theme={theme === "dark" ? "vs-dark" : "vs-light"}
            value={output}
            options={{
              fontSize: 14,
              minimap: { enabled: false },
              wordWrap: "on",
              lineNumbers: "on",
              lineHeight: 20,
              automaticLayout: true,
              readOnly: true,
            }}
          />
        </div>
      </div>
    );
};

export default OutputWindow;
