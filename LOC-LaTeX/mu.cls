%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lords of Creation god-sheet (mu.cls)
% LaTeX Template
%
% Main version
% 
%
% Original author:
% .. (..)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
% Important notes:
% This template is designed to be compiled with pdflatex.
% To produce a simple document with this class you just need to create a .tex file as follws:
%
%\documentclass{mu}
%\begin{document}
%\title
%\pagestyle{empty}
%\chapterimage{cap0.png}
%\pdfbookmark{\contentsname}{toc}
%\tableofcontents
%\cleardoublepage
%\pagestyle{fancy}
%\chapterimage{cap1.png}
%\chapter{A}
%\section{B}
%\subsection{C}
%\end{document}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{lc}[09/12/2013 Generic manual class]
\LoadClass[10pt,fleqn,openany]{book}


%%%%%%%%%%%
% Source  %
%%%%%%%%%%%
\RequirePackage{microtype}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath,amsthm}
\RequirePackage{times}
\RequirePackage{capt-of}
\RequirePackage{eso-pic}
\RequirePackage[demo]{graphicx} % [demo] crea placeholders per pic inesistenti
\RequirePackage{tikz}
\RequirePackage{lipsum}
\RequirePackage{mdframed}
\RequirePackage[font={footnotesize}]{subcaption}
\RequirePackage[font={small},width=.8\textwidth]{caption}
\RequirePackage[top=3cm,bottom=3cm,left=3.2cm,right=3.2cm,headsep=10pt,a4paper]{geometry}
\RequirePackage[italian]{babel}
\RequirePackage{enumitem}
\setlist{nolistsep} 
\RequirePackage{csquotes}
\RequirePackage{todonotes}



%%%%%%%%%%%
% Colori  %
%%%%%%%%%%%
\definecolor{color1}{RGB}{150,0,0} % title and sections
\definecolor{color1}{RGB}{20,79,181} % box background and authors
\colorlet{com}{black!5}
\newmdenv[backgroundcolor=com,outerlinecolor=com,linecolor=com,skipbelow=.5\baselineskip plus2pt minus2pt,skipabove=.5\baselineskip plus2pt minus2pt]{com}
\gdef\ttdefault{cmtt}%



%%%%%%%%%%%
% Link    %
%%%%%%%%%%%
\usepackage{hyperref}
\hypersetup{hidelinks,backref=true,pagebackref=true,hyperindex=true,colorlinks=false,breaklinks=true,urlcolor= blue,bookmarks=true,bookmarksopen=false,pdftitle={Gods, a LoC adaptation},pdfauthor={Calamaro Warriors}}
% paramètres de compression pdf
\pdfminorversion=5
\pdfobjcompresslevel=6 
\pdfcompresslevel=9


%%%%%%%%%%%
% Titoli  %
%%%%%%%%%%%
\usepackage{titletoc}
\contentsmargin{0cm}
\titlecontents{chapter}[1cm]
{\addvspace{10pt}\large\sffamily\bfseries}%\llap{\chaptername\ }
{\color{color1!60}\contentslabel[\Large\thecontentslabel]{1cm}\color{color1}}
{}  
{\color{color1!60}\normalsize\sffamily\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage}%  
   
\titlecontents{section}[1cm]
  {\addvspace{5pt}\bfseries}
  {\contentslabel[\thecontentslabel]{1cm}}
  {}
  {\hfill\color{black}\thecontentspage}
  []
\titlecontents{subsection}[1cm]
  {\addvspace{-1pt}\small\strut\vphantom{Éq}}
  {\contentslabel[\thecontentslabel]{1cm}}
  {}
  {\;\titlerule*[.5pc]{.}\;\thecontentspage}
  []  
   
   
   
%%%%%%%%%%%
% Stile   %
%%%%%%%%%%%
\usepackage{fancyhdr}
\newlength\debordement\setlength\debordement{0pt}
\pagestyle{fancy}
\fancyheadoffset{\debordement}
\fancyfootoffset{\debordement}
\renewcommand{\chaptermark}[1]{\markboth{\normalfont\normalsize\bfseries #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\normalfont\normalsize\thesection\hspace{5pt}#1}{}%
}
\fancyhf{} \fancyhead[LE,RO]{\normalfont\normalsize\thepage}
\fancyhead[LO]{\rightmark}
\fancyhead[RE]{\leftmark}
\renewcommand{\headrulewidth}{0.5pt}
\addtolength{\headheight}{2.5pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}}
\makeatletter
							  
% enlève l'entête des pages de fin de chapitre si nombre de pages impair
\renewcommand{\cleardoublepage}{%
\clearpage\ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\thispagestyle{empty}
\newpage
\fi
}


%%%%%%%%%%%%%%%%%%
% Chapter image  %
%%%%%%%%%%%%%%%%%%
\makeatletter%
% définition de l'entête des chapitres
\newcommand{\thechapterimage}{}%
\newcommand{\chapterimage}[1]{\renewcommand{\thechapterimage}{#1}}%
\def\thechapter{\arabic{chapter}}%
\def\@makechapterhead#1{%
\thispagestyle{empty}%
  {\centering \normalfont\sffamily%
    \ifnum \c@secnumdepth >\m@ne%
      \if@mainmatter%
	  \startcontents%
	  \begin{tikzpicture}[remember picture,overlay]%
         \node at (current page.north west)%
         {\begin{tikzpicture}[remember picture,overlay]%
		   \node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
		   %\draw[fill=color1!25,color=color1!25,opacity=.6] (1cm,0) rectangle (8cm,-8cm);
		   \node[inner sep=6pt,anchor=north west,fill=color1!25,color=color1!25,text opacity=1, fill opacity=.6] at (1cm,-.5cm) {\parbox[t][][t]{7.3cm}{\color{black}\huge\bfseries Capitolo\ \thechapter\flushleft\vspace*{-7pt}\printcontents{l}{1}{\setcounter{tocdepth}{2}}}};
		   \draw[anchor=east] (20cm,-9cm) node [fill=color1!25]{\strut\Huge\sffamily\bfseries\textcolor{black}{#1\vphantom{plÉ}}};
       \end{tikzpicture}};
      \end{tikzpicture}}\par\vspace*{230\p@}%
}
\def\@makeschapterhead#1{%
\thispagestyle{empty}%
  {\centering \normalfont\sffamily%
    \ifnum \c@secnumdepth >\m@ne%
      \if@mainmatter%
	  \startcontents%
	  \begin{tikzpicture}[remember picture,overlay]%
         \node at (current page.north west)%
         {\begin{tikzpicture}[remember picture,overlay]%
		   \node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
		   \draw[anchor=east] (20cm,-9cm) node [fill=color1!25]{\Huge\sffamily\bfseries\textcolor{black}{#1\vphantom{plÉ}}};
       \end{tikzpicture}};
      \end{tikzpicture}}\par\vspace*{230\p@}%
}%
\renewcommand{\@seccntformat}[1]{\llap{\csname the#1\endcsname\hspace*{7pt}}}
\makeatother



%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copertina e successive %
%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\title}{\begingroup
\thispagestyle{empty}\mbox{}
\AddToShipoutPicture*{\includegraphics{cover}}

\newpage							% % Pagina della licenza e dei crediti
\mbox{}\thispagestyle{empty}  
\hspace*{-1cm} 
Cover image credit to \href{http://creativecommons.org/licenses/by-nc-sa/3.0/}{AuthorName}. All rights reserved.\newline
Backcover image credit to \href{http://creativecommons.org/licenses/by-nc-sa/3.0/}{AuthorName}. All rights reserved.
\vfill\normalsize\selectfont		

\noindent
	\DeclareGraphicsExtensions{.pdf,.png,.jpg}
	\begin{flushleft} % tolgo la centratura e la didascalia
		\includegraphics[width=0.5\textwidth]{by-nc-sa.png}
	\end{flushleft}
\label{fig:cc}
This document is licensed under a \href{http://creativecommons.org/licenses/by-nc-sa/3.0/}{Attribution-NonCommercial-ShareAlike 3.0 Unported.}
\endgroup

\newpage					
\begin{flushright}					% % Pagina della dedica
\vspace*{5cm}
\emph{Aqesdfgh jkl okp'ii\\--Yo}

\end{flushright}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%
% Twocolumn environment  %
%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{multicol}

\newcommand{\body}[1]{
\begin{multicols}{2}
{#1}
\end{multicols}
}




%%%%%%%%%%%%%
% Footnote  %
%%%%%%%%%%%%%
%\fancyfoot[C]{		% % aggiunta per numero di pagina spostabile e sovrapposto a figura (o box)  
%\begin{picture}(100,100)
%   \put(270,70){\framebox{\phantom{\rule{10pt}{10pt}}}} %Dummy box in place of an image.
%   %\put(270,70){\includegraphics[scale=0.2]{pagenum.png}}
%   \put(275,70){\hbox{\bfseries\thepage}}
%\end{picture}  
%}
