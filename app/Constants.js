export const Language_Versions = {
   "bash" : "5.2.0",
   "c" : "10.2.0",
   "cpp" : "10.2.0",
   "csharp" : "6.12.0",
   "java" : "15.0.2",
   "javascript" : "18.15.0",
   "kotlin" : "1.8.20",
   "perl" : "5.36.0",
   "php" : "8.2.3",
   "python" : "3.10.0",
   "ruby" : "3.0.1",
   "rust" : "1.68.2",
   "swift" : "5.3.3",
   "typescript" : "5.0.3",
};



export const Code_Snippets = {
   bash: `#!/bin/bash\nname="Arjun"\necho "Hello, $name!"\n`,
   c: `#include <stdio.h>\n\nint main() {\n\tchar name[] = "Arjun";\n\tprintf("Hello, %s!\\n", name);\n\treturn 0;\n}\n`,
   cpp: `#include <iostream>\n\nint main() {\n\tstd::string name = "Arjun";\n\tstd::cout << "Hello, " << name << "!" << std::endl;\n\treturn 0;\n}\n`,
   csharp: `using System;\n\nclass Program {\n\tstatic void Main() {\n\t\tstring name = "Arjun";\n\t\tConsole.WriteLine($"Hello, {name}!");\n\t}\n}\n`,
   java: `public class Main {\n\tpublic static void main(String[] args) {\n\t\tString name = "Arjun";\n\t\tSystem.out.println("Hello, " + name + "!");\n\t}\n}\n`,
   javascript: `function greet(name) {\n\tconsole.log("Hello, " + name + "!");\n}\n\ngreet("Arjun");\n`,
   kotlin: `fun greet(name: String) {\n\tprintln("Hello, $name!")\n}\n\ngreet("Arjun")\n`,
   perl: `sub greet {\n\tmy $name = shift;\n\tprint "Hello, $name!\\n";\n}\n\ngreet("Arjun");\n`,
   php: `<?php\nfunction greet($name) {\n\techo "Hello, " . $name . "!";\n}\n\ngreet("Arjun");\n?>\n`,
   python: `def greet(name):\n\tprint(f"Hello, {name}!")\n\ngreet("Arjun")\n`,
   ruby: `def greet(name)\n\tputs "Hello, #{name}!"\nend\n\ngreet("Arjun")\n`,
   rust: `fn greet(name: &str) {\n\tprintln!("Hello, {}!", name);\n}\n\ngreet("Arjun");\n`,
   swift: `func greet(name: String) {\n\tprint("Hello, \(name)!")\n}\n\ngreet("Arjun")\n`,
   typescript: `function greet(name: string): void {\n\tconsole.log("Hello, " + name + "!");\n}\n\ngreet("Arjun");\n`,
 };
 

 export const Extensions = {
   bash:"sh",
   c: "c",
   cpp: "cpp",
   csharp: "cs",
   java: "java",
   javascript: "js",
   kotlin: "kt",
   perl: "pl",
   php: "php",
   python: "py",
   ruby: "rb",
   rust: "rs",
   swift: "swift",
   typescript: "ts",
 };

 export const Download_Filename = {
   bash:"script",
   c: "main",
   cpp: "main",
   csharp: "Test",
   java: "Main",
   javascript: "script",
   kotlin: "Main",
   perl: "script",
   php: "script",
   python: "script",
   ruby: "script",
   rust: "main",
   swift: "Main",
   typescript: "script",
 };