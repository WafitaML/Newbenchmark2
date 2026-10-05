\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{altacv}[2026/10/05 Self-contained modern CV class]
\LoadClassWithOptions{extarticle}

\RequirePackage[a4paper,margin=0.6cm]{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{ragged2e}
\RequirePackage{titlesec}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\hypersetup{colorlinks=true,urlcolor=accent,pdfborder={0 0 0}}

\providecolor{heading}{HTML}{12324A}
\providecolor{accent}{HTML}{087E8B}
\providecolor{emphasis}{HTML}{243746}
\providecolor{body}{HTML}{263238}
\color{body}

\newcommand{\cvname}{}
\newcommand{\cvtagline}{}
\newcommand{\cvphoto}{}
\newcommand{\cvphotosize}{0cm}
\newcommand{\name}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\tagline}[1]{\renewcommand{\cvtagline}{#1}}
\newcommand{\personalinfo}[1]{}
\newcommand{\photo}[2]{\renewcommand{\cvphotosize}{#1}\renewcommand{\cvphoto}{#2}}

\newcommand{\makecvheader}{%
  \begin{minipage}[c]{0.77\textwidth}
    {\fontsize{25}{28}\selectfont\bfseries\color{heading}\cvname}\par
    \vspace{3pt}{\color{accent}\rule{3.2cm}{2.2pt}}\par\vspace{4pt}
    {\small\color{emphasis}\RaggedRight\cvtagline\par}
  \end{minipage}\hfill
  \begin{minipage}[c]{0.19\textwidth}\centering
    \ifdefempty{\cvphoto}{}{%
      \IfFileExists{\cvphoto.png}{\begin{tikzpicture}\clip (0,0) circle (\cvphotosize/2);\node at (0,0){\includegraphics[width=\cvphotosize,height=\cvphotosize]{\cvphoto}};\draw[accent,line width=1.5pt] (0,0) circle (\cvphotosize/2);\end{tikzpicture}}{%
      \IfFileExists{\cvphoto.jpg}{\includegraphics[width=\cvphotosize,height=\cvphotosize,keepaspectratio]{\cvphoto}}{\begin{tikzpicture}\fill[accent!12] (0,0) circle (1.35cm);\node[heading,font=\Large\bfseries] at (0,0) {WY};\draw[accent,line width=1.5pt] (0,0) circle (1.35cm);\end{tikzpicture}}}}
  \end{minipage}\par\vspace{5pt}
  {\color{accent!35}\rule{\textwidth}{0.7pt}}\vspace{2pt}
}

\newcommand{\cvsection}[1]{%
  \par\vspace{4pt}%
  {\large\bfseries\color{heading}\MakeUppercase{#1}}\par\vspace{1.5pt}%
  {\color{accent}\rule{1.05cm}{1.8pt}\hspace{3pt}\color{accent!25}\rule{\dimexpr\linewidth-1.35cm\relax}{0.5pt}}\par\vspace{3pt}}

\newcommand{\cvevent}[4]{%
  {\normalsize\bfseries\color{emphasis}#1}\par
  \vspace{1pt}{\small\bfseries\color{accent}#2}\par
  \vspace{1pt}{\footnotesize\color{body!78}\textbf{#3}\hfill\textit{#4}}\par\vspace{1pt}}

\newcommand{\contactline}[2]{%
  \par\noindent\begin{minipage}[t]{1.45em}\color{accent}\bfseries #1\end{minipage}%
  \begin{minipage}[t]{\dimexpr\linewidth-1.65em\relax}\small #2\end{minipage}\par}
\newcommand{\email}[1]{\contactline{@}{\href{mailto:#1}{#1}}}
\newcommand{\phone}[1]{\contactline{T}{#1}}
\newcommand{\location}[1]{\contactline{\raisebox{.15ex}{\scriptsize$\blacktriangleright$}}{#1}}
\newcommand{\itemmarker}{\textbullet}

\AtBeginDocument{\renewcommand\labelitemi{\color{accent}\itemmarker}}
