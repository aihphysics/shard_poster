\ProvidesClass{shard_poster}[22/03/23 Class for typesetting posters]

\RequirePackage{textpos}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{pifont}
\RequirePackage{transparent}
\RequirePackage[linktoc=none]{hyperref}
\RequirePackage{eso-pic}
\RequirePackage{cancel}
\RequirePackage{amsmath}
\RequirePackage{fixmath}
\RequirePackage{setspace}
\RequirePackage{blindtext}
\RequirePackage{xcolor}
\RequirePackage{fontawesome5}
\RequirePackage[page]{totalcount}
\RequirePackage{kvoptions}
%%\RequirePackage{contents}
\RequirePackage[most]{tcolorbox}
\RequirePackage[nott]{inconsolata}
\RequirePackage[T1]{fontenc}
\RequirePackage{calculator}
\RequirePackage{ifthen}
\RequirePackage{xparse}

\newcommand{\titling}{\fontsize{8pt}{3pt}\selectfont}
\newcommand{\titlingB}{\fontsize{9pt}{5pt}\selectfont}
\newcommand{\BigTitle}{\fontsize{13pt}{15pt}\selectfont}
\newcommand{\large}{\fontsize{9pt}{5pt}\selectfont}
\newcommand{\Large}{\fontsize{8pt}{6pt}\selectfont}
\newcommand{\body}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\normal}{\fontsize{5pt}{7pt}\selectfont}
\newcommand{\header}{\fontsize{6pt}{10pt}\selectfont}
\renewcommand{\normalsize}{\fontsize{5pt}{7pt}}
\newcommand{\small}{\fontsize{6pt}{6pt}\selectfont}

\newcommand{\Title}{\fontsize{48pt}{36pt}\selectfont}
\newcommand{\Subtitle}{\fontsize{36pt}{36pt}\selectfont}
\newcommand{\BigTit}{\fontsize{24pt}{18pt}\selectfont}

%%\newcommand{\Title}{\fontsize{64pt}{36pt}\selectfont}
%%\newcommand{\Subtitle}{\fontsize{56pt}{36pt}\selectfont}
%%\newcommand{\BigTit}{\fontsize{48pt}{36pt}\selectfont}
%%\newcommand{etitling}{\fontsize{18pt}{7pt}\selectfont}
%%\newcommand{\large}{\fontsize{15pt}{9pt}\selectfont}
%%\newcommand{\Large}{\fontsize{15pt}{12pt}\selectfont}
%\newcommand{\normal}{\fontsize{12pt}{10pt}\selectfont}
%%\newcommand{\header}{\fontsize{12pt}{10pt}\selectfont}
%\renewcommand{\normalsize}{\fontsize{10pt}{10pt}}
%%\newcommand{\small}{\fontsize{4pt}{6pt}\selectfont}
\renewcommand{\body}{\fontsize{24pt}{20pt}\selectfont}
\newcommand{\main}{\fontsize{15pt}{18pt}\selectfont}
%%\setlength{\paperheight}{59.40cm}
%%\setlength{\paperwidth}{42.0cm}
\setlength{\paperheight}{46.81in}
\setlength{\paperwidth}{33.11in}
\setlength\topsep{0.3em}
\setlength\labelsep{3pt}
\setlength\leftmargin{5pt}
\setlength\itemsep{0.2em}



\RequirePackage[]{concmath}
\renewcommand\rmdefault{zi4}
\renewcommand\sfdefault{zi4}
\renewcommand\ttdefault{zi4}
\renewcommand\ttdefault{zi4}
\renewcommand\familydefault{zi4}
\renewcommand\seriesdefault{zi4}
\renewcommand\shapedefault{zi4}
\renewcommand\bfdefault{zi4} 
\renewcommand\mddefault{zi4}
\renewcommand\itdefault{zi4}
\renewcommand\sldefault{zi4}
\renewcommand\scdefault{zi4}
\renewcommand\updefault{zi4}




\RequirePackage[ papersize={\paperwidth, \paperheight}, rmargin=0.25cm, lmargin=0.25cm, tmargin=0.25cm, bmargin=0.25cm,
                 head=0.5cm, headsep=0cm, foot=0.5cm ]{geometry}
\RequirePackage{lastpage}
\RequirePackage[ subdivisions=3, heightr=1, width=\textwidth, borderwidth=0.0pt, roundnessa=0pt, linecolor=darkgray, tickswidth=0.0pt, ticksheight=0.0pt, emptycolor=gray, filledcolor=black]{ progressbar }


\AtBeginDocument{
    \newcounter{sectionwritecounter}
    \setcounter{sectionwritecounter}{0}
    \def\sectionlist{}
    \newcounter{section}
    \setcounter{section}{0}
    \newcounter{sectionprintout}

}

\AtEndDocument{ 
	\immediate\write\@auxout{\gdef\string\notinitial{1}}
    \immediate\write\@auxout{\gdef\string\outsection{\sectionlist}}
    \immediate\write\@auxout{\gdef\string\totalsections{\thesection}}
}

\newtcolorbox{bgbox}[1][]{nobeforeafter, leftright skip=0in, boxrule=0pt, enhanced jigsaw, rounded corners, arc=20pt, grow to left by=-5pt, grow to right by=-5pt,#1, boxrule=0pt, after=\vspace{3pt}, before=\vspace{3pt}\centering }
\newtcolorbox{tgbox}[1][]{nobeforeafter, leftright skip=0in, boxrule=0pt, enhanced jigsaw, rounded corners, arc=20pt, grow to left by=-5pt, grow to right by=-5pt,#1, before=\vspace{3pt} }

\def\token{TOKEN}

\newcommand\tableofcontents{%
    \raggedright \header{\underline{Progress}:}\normal\\\@starttoc{toc}
}

\newcommand{\secmark}{\sectionmark}
\newcommand{\section}[1]{
  \par\refstepcounter{section}% Increase section counter
  \renewcommand{\secmark}{\sectionmark[#1}
  %%\addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}% Add section to ToC
  \addcontentsline{toc}{section}{#1\\}% Add section to ToC
  \g@addto@macro\sectionlist{#1,}
  \message{\sectionlist}
}

\newcommand{\idot}{{\textcolor{white}{\textbullet}}}
\newcommand{\bdot}{{\textcolor{black}{\textbullet}}}
\newcommand{\bitem}{ \item[\bdot] }
\newcommand{\witem}{ \item[\idot] }

\NewDocumentCommand \titlepane {O{Title} O{Subtitle} O{Author} O{Location/Date} }
    {\normal\begin{bgbox}[ height=0.1\paperheight, colback=darkgray, width=0.3\textwidth-7.5pt-0.125cm ]
            \begin{center}
                \vspace{0.02\paperheight}
                \includegraphics[ height=0.05\paperheight ]{ATLAS_LOGO.png}
            \end{center}
		\end{bgbox}
        \begin{bgbox}[ height=0.1\paperheight, colback=darkgray, width=0.7\textwidth-7.5pt-0.125cm, rightrule=0pt ]
            \begin{center}
                \textcolor{white}{
                    \vspace{0.025\textheight}\\ \Title{#1}\\\Subtitle{#2}\\
                    \vspace{0.0075\textheight}\BigTit #3 - #4
                }
            \end{center}
		\end{bgbox}
        \nopagebreak
	}

%%\NewDocumentEnvironment{pane}{}{\begin{tgbox}[ height=0.22\paperheight, colback=white, width=0.5\textwidth-10pt-0.25cm, rightrule=0pt, boxrule=10pt ]\body\color{black}}{\end{tgbox}} 
%%\NewDocumentEnvironment{pane}{}{\begin{tgbox}[ height=0.22\paperheight, colback=white, width=0.5\textwidth-10pt-0.25cm, rightrule=0pt, boxrule=10pt ]\body\color{black}}{\end{tgbox}} 
\NewDocumentEnvironment{pane}{}{\begin{tgbox}[ height=0.22\paperheight, colback=white, width=0.5\textwidth-7.5pt-0.125cm, rightrule=0pt, boxrule=10pt ]\body\color{black}}{\end{tgbox}} 

\pagenumbering{arabic}
