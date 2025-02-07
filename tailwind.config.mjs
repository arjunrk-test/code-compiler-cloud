/** @type {import('tailwindcss').Config} */
export default {
    darkMode: ["class"],
    content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
  	extend: {
		colors: {
			navbar: "var(--navbar-bg)",
			navbarHover: "var(--navbar-hover)",
			navbarText: "var(--navbar-text)",
			runButton: "var(--run-btn-bg)",
			runButtonHover: "var(--run-btn-hover)",
			runButtonText: "var(--run-btn-text)",
			dropdownBg: "var(--dropdown-bg)",
			dropdownText: "var(--dropdown-text)",
			dropdownVersion: "var(--dropdown-version)",
			miniNavBg: "var(--mini-nav-bg)",
			miniBoxBg: "var(--mini-box-bg)",
			miniBoxTx: "var(--mini-box-tx)",
			gutterBg: "var(--gutter-bg)",
		 },
  		borderRadius: {
  			lg: 'var(--radius)',
  			md: 'calc(var(--radius) - 2px)',
  			sm: 'calc(var(--radius) - 4px)'
  		}
  	}
  },
  plugins: [require("tailwindcss-animate")],
};
