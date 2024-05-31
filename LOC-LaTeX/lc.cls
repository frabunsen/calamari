%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lords of Creation god-sheet (lc.cls)
% LaTeX Template
%
% Main version
% 
% This template has been downloaded from:
% http://..
%
% Original author:
% Francesco Sensi (francesco.sensi@ge.infn.it)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
% Important notes:
% This template is designed to be compiled with pdflatex.
% To produce a document with this class you just need to create a .tex file as follws:
%
%\documentclass{lc}
%\begin{document}
%\logo
%\intro
%\dominii
%\daytable
%\licence
%\end{document}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{lc}[06/08/2013 LoC god-sheet class]
\LoadClass[10pt]{article}



%%%%%%%%%%%
% Tweaks  %
%%%%%%%%%%%

\RequirePackage[a4paper,top=0.7cm,bottom=0.1cm,left=1cm,right=2cm,hmarginratio=1:1]{geometry}
\RequirePackage{hyperref}
\RequirePackage{lipsum}
\RequirePackage[italian]{babel}


%%%%%%%%%%%
% Figures %
%%%%%%%%%%%

\RequirePackage{picture,graphicx}
\RequirePackage{fancybox}
\RequirePackage{tikz}
\RequirePackage{alltt}


%%%%%%%%%%%%%%
% Background %
%%%%%%%%%%%%%%%
\RequirePackage{eso-pic}
\newcommand{\BackgroundPic}[1]{%
\put(0,0){%
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight]{galx.png}% alcuni suggeriscono [..,keepaspectratio]
\vfill
}}}



%%%%%%%%%%%
% Header  %
%%%%%%%%%%%

\newcommand{\logo}{
	\begin{minipage}[t]{0.25\textwidth}
		\begin{flushleft} % mezzucci per far star a posto la scritta..TODO: fare con tikz..
		\end{flushleft}
	\end{minipage}
	\begin{minipage}[t]{0.50\textwidth}
		\begin{center}
			\hspace{-0.7cm}
			\framebox{
				\resizebox{9.5cm}{!}{\bf{Lords of Creation}}
			}
		\end{center}
	\end{minipage}
	\begin{minipage}[t]{0.25\textwidth}
		\begin{flushright} 
	    \end{flushright}
	\end{minipage}

%\begin{center}
%	\includegraphics*[width=4cm,height=0.2cm]{calamari.png} 
%\end{center}
\vspace*{1cm}
}


%%%%%%%%%%%
% PG Data %
%%%%%%%%%%%

\newcommand{\intro}{
	\begin{minipage}[t]{0.5\textwidth}
		\textbf{Nome Giocatore} \hrulefill \newline
		\textbf{Nome Campagna}	\hrulefill
	\end{minipage}
	\begin{minipage}[t]{0.5\textwidth}
		\textbf{Nome God} \hrulefill \newline
		\textbf{Sacred Day} \hrulefill
	\end{minipage}
\vspace*{0.5cm}
}


%%%%%%%%%%%
% Dominii %
%%%%%%%%%%%

\newcommand{\dominii}{

\begin{minipage}[tb]{0.54\textwidth} % put (distanza orizziontale dalla parola, centratura verticale), framebox (lunghezza, larghezza)		
	\textbf{Dominii Maggiori} \put(7,-2){\framebox(168,12)}\newline 
	
	\textbf{Dominii Intermedi} \put(3,-2){\framebox(168,12)}
				  \put(3,-18){\framebox(168,12)}

	\vspace*{0.4cm}
	\textbf{Dominii Minori} \put(17,-2){\framebox(168,12)}
			   \put(17,-18){\framebox(168,12)}	
			   \put(17,-34){\framebox(168,12)}	
\end{minipage}
\begin{minipage}[!]{0.5\textwidth}
	\framebox(250,120){
			\begin{tabular}{l l l l}
					\textbf{0 PP} & Shape & \textbf{3 PP} & bla		\\
					\textbf{1 PP} & Command & \textbf{3 PP} & bla	\\
					\textbf{1 PP} & Mold & \textbf{3 PP} & bla				\\
					\textbf{1 PP} & Create Populace & \textbf{3 PP} & bla		\\
					\textbf{1 PP} & Create Animal & \textbf{3 PP} & bla	\\
					\textbf{2 PP} & Create Beast & \textbf{4 PP} & bla		\\
					\textbf{2 PP} & Create Magical Beast & \textbf{4 PP} & bla \\
					\multicolumn{4}{l}{$\dagger$ \textbf{Divine Combat} 1d20 + Artifact + PP/week}\\
					\multicolumn{1}{l}{$\ddagger$ \textbf{Blabla} bla}\\ % {le colonne che spanna}{la centratura}
			\end{tabular}		
		 }	
\end{minipage}
\vspace*{0.5cm}
}


%%%%%%%%%%%%%%%
% Day Table   %
%%%%%%%%%%%%%%%

\newcommand{\daytable}{

%\textbf{Azioni} 	\hspace*{240pt} \color{black}{\textbf{PP pool}}\\

\begin{minipage}[!]{0.65\textwidth}
	1 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\ % un carattere occupa spazio 5
	2 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\
	3 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\
	4 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\
	5 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\
	6 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\
	7 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\
	8 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\
	9 \line(1,0){280}  \put(6,0){\framebox(24,12)}\\
	10 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	11 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	12 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	13 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	14 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	15 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	16 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	17 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	18 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	19 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	20 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	21 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	22 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	23 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	24 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	25 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	26 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	27 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	28 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	29 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	30 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	31 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	32 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	33 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	34 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	35 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	36 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	37 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	38 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	39 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
	40 \line(1,0){275}  \put(6,0){\framebox(24,12)}\\
\end{minipage}
\begin{minipage}[htbp]{0.1\textwidth}
	\framebox(194,510){}
\end{minipage}
}


%%%%%%%%%%%%%
% Licence   %
%%%%%%%%%%%%%
% see more @ http://pairach.com/2012/04/06/how-to-licence-your-thesis-using-creative-commons/
\newcommand{\licence}{
\vspace*{0.3cm}
	\DeclareGraphicsExtensions{.pdf,.png,.jpg}
	%\begin{center} % tolgo la centratura e la didascalia
		\leavevmode
		\includegraphics[width=0.7in]{by-nc-sa.png}
	%\end{center}
%\label{fig:cc}
\scriptsize{This document is licensed under a \href{http://creativecommons.org/licenses/by-nc-sa/3.0/}{Attribution-NonCommercial-ShareAlike 3.0 Unported.}}
}