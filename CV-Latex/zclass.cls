%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Curriculum/resume (zclass.cls)
% LaTeX Template
%
% Main version
%
% Original author:
% frabunsen (frabunsen@gmail.com)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
% Important notes:
% This template has been inspired by A.Friggeri (adrien@friggeri.net) @ https://github.com/afriggeri/CV
% This version of the template is designed to be compiled with pdflatex.
% To produce a document with this class you just need to create a .tex file as follows:
%
%\documentclass[print]{zclass}
%\begin{document}
%\header{Name}{Surname}{foto.png}{Profession}
%\entry{maagenta}{In brief}{text}{Education}{text}
%\closure{signature.png}
%\end{document}
%
%
% Compile with 
%		pdflatex --shell-escape test.tex
% Mainly to execute the \write18 example-image call
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

\ProvidesClass{zclass}[31/07/2013 CV class]
\NeedsTeXFormat{LaTeX2e}


%%%%%%%%%%%%%%%
% IF options  %
%%%%%%%%%%%%%%%

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption{eng}{\def\@cv@eng{}}
% USAGE: \documentclass[eng,print]{zclass}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}

\ProcessOptions\relax
\LoadClass{article}




%%%%%%%%%%%
% Tweaks  %
%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\usepackage{picture,lipsum}


%\ifdefined\@cv@eng
\RequirePackage[british]{babel}
%\else
%\RequirePackage[anotherlanguage]{babel}
%\fi


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{5C5B5B}


\definecolor{greene}{RGB}{35,201,117}
\definecolor{maagenta}{HTML}{D3A4F9}  
\definecolor{orange}{HTML}{FDA333}
\definecolor{red}{HTML}{FB4485}
\definecolor{bluette}{RGB}{14,188,232}
\definecolor{black}{RGB}{0,0,0}

\ifdefined\@cv@print 
  \colorlet{greene}{gray}
  \colorlet{orange}{gray}
  \colorlet{maagenta}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{bluette}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{black}
  \colorlet{lineheader}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white} 
  \colorlet{lineheader}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}
\colorlet{lineheader}{gray}


%%%%%%%%%%%%%%%%
% Page Numbers %
%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr,lastpage,hyperref}
\renewcommand{\@oddfoot}{\small{\hfil \thepage/\pageref*{LastPage}}}


%%%%%%%%%%
% Header %
%%%%%%%%%%
\RequirePackage{tikz,marvosym}

\newcommand{\header}[4]{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4.1cm] (box) at (current page.north){};
     \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}
       \textit{\textbf{#1 #2}}
    };
    
    \node [anchor=center] (foto) at (box.west) {%
		\hspace{4cm}\includegraphics[scale=0.2]{#3} 
    };
    
    \node [anchor=center] (personal) at (box.east) {%
		 \hspace{-4cm} 
		 \fontsize{10pt}{10pt}\color{header}
			\begin{tabular}{c|l}
			
			
			  \Writinghand & 3848 Fallon Drive, Thamesford (CA)\\
			  \Mobilefone  &  519-285-4404\\
			  \Telefon     & 519-285-4404\\
              \Letter      & \texttt{fakemail@fakeprovider.com}
            \end{tabular}					 
    };
    
    
    \node [anchor=north] (employe) at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}
       #4 
    };
    
  \node [anchor=north] (motto) at (employe.south) {%
      \fontsize{8pt}{8pt}\color{header}
      \begin{tabular}{c c} 
      \quad & \\ 
      \textit{``D'ouch!" -- H. Simpson } %& \\
      \end{tabular}
    };
    
    
    
    
  \draw [lineheader, thick] (-7,-1.75) -- (19,-1.75);
  
   \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}



%%%%%%%%%%%%
% CV Body  %
%%%%%%%%%%%%

\newenvironment{body}[2]{
\begin{list}{}{%
\setlength{\topsep}{0pt}%
\setlength{\leftmargin}{#1}%
\setlength{\rightmargin}{#2}%
\setlength{\listparindent}{\parindent}%
\setlength{\itemindent}{\parindent}%
\setlength{\parsep}{\parskip}%
}%
\item[]}{\end{list}}
% USAGE: 
%\begin{body}{-5cm}{0cm} text \end{body}



%%%%%%%%%%%%%
% CV Entry  %
%%%%%%%%%%%%%

\newcommand{\entry}[5]{
\begin{body}{-5cm}{0cm}
		\begin{minipage}[t!]{0.25\textwidth}
			\begin{tikzpicture}
			\node [draw=#1, fill=#1, fill opacity=0.2, very thick, rectangle, rounded corners, inner sep=5pt, inner ysep=10pt, draw 
			opacity=1, text opacity=1, text width=4cm](about) {
			 \tiny{#3}
			};
			\tikzstyle{fancytitle}=[fill=#1, rounded corners, text=white]
			\node[fancytitle, right=6pt] at (about.north west) {#2};
			\node[fancytitle, rounded corners] at (about.east) {\large{\StrLeft{#4}{1}}};
		\end{tikzpicture}
		\end{minipage}
		\begin{minipage}[t!]{0.10\textwidth} 
			\hspace*{1cm}
		\end{minipage}
		\begin{minipage}[t!]{0.9\textwidth}
			\section*{\LARGE{#4\vspace*{2pt}\shrulefill{1.5pt}}}
			\vspace{-4pt}
			#5
		\end{minipage}	
		\vspace{0.5cm}		
\end{body}
}
% USAGE: 
%\entry{magenta}{In brief}{\lipsum[1]}{Education}{\lipsum[1]}




%%%%%%%%%%%%%%
% CV Section %
%%%%%%%%%%%%%%

\newcommand{\longsection}[1]{
\begin{body}{-4.3cm}{0cm}
	\section*{#1}
	\vspace{-17pt}
	\shrulefill{1pt}
\end{body}
}
% USAGE:
% \longsection{Work Experience}



%%%%%%%%%%%%%%
% CV Entry 2 %
%%%%%%%%%%%%%%

\newcommand{\longentry}[3]{
\begin{body}{-4.3cm}{0cm}
	\begin{minipage}[t]{0.25\textwidth} 
	

			\textbf{Period}\\

		#1
	\end{minipage}
	\begin{minipage}[t]{0.05\textwidth} 
		\hspace*{2cm}
	\end{minipage}
	\begin{minipage}[t]{0.95\textwidth}
	

		\textbf{Position}\\
		
		{\textit{#2 \hrule \vspace{8pt} }}
		#3
	\end{minipage}	
	\vspace{6pt}		
\end{body}
}



\newcommand{\longentrybis}[3]{
\begin{body}{-4.3cm}{0cm}
	\begin{minipage}[t]{0.25\textwidth}
		#1
	\end{minipage}
	\begin{minipage}[t]{0.05\textwidth}
		\hspace*{2cm}
	\end{minipage}
	\begin{minipage}[t]{0.95\textwidth}
		{\textit{#2 \hrule \vspace{8pt} }}
		#3
	\end{minipage}	
	\vspace{6pt}		
\end{body}
}

\newcommand{\longentrytris}[3]{
\begin{body}{-4.3cm}{0cm}
	\begin{minipage}[t]{0.25\textwidth}
		#1
	\end{minipage}
\hspace*{7pt} 
	\begin{minipage}[t]{0.9\textwidth}
		{\textit{#2 \vspace{8pt} }}
		#3
	\end{minipage}	
	\vspace{0.5cm}		
\end{body}
}


\newcommand{\longentrytrisalt}[3]{
\begin{body}{-4.3cm}{0cm}
	\begin{minipage}[t]{0.25\textwidth} 
		#1
	\end{minipage}
\hspace*{21pt} 
	\begin{minipage}[t]{0.9\textwidth}
		{\textit{#2 \vspace{8pt} }}
		#3
	\end{minipage}	
	\vspace{0.5cm}		
\end{body}
}


\newcommand{\longentryvier}[2]{
\begin{body}{-4.3cm}{0cm}
	\textbf{#1} #2	
\end{body}
}






%%%%%%%%%%%%
% Hrule    %
%%%%%%%%%%%%
\makeatletter
  \def\shrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\makeatother

% USAGE: 
% shrulefill{3pt}


%%%%%%%%%%%%%%%%%
% 1rst Letter   %
%%%%%%%%%%%%%%%%%
\RequirePackage{xstring}

% USAGE:
% \StrLeft{#1}{1}




%%%%%%%%%%%%%%%%%
% BOTTOM END    %
%%%%%%%%%%%%%%%%%
\RequirePackage{pstricks,graphicx}


\newcommand{\closure}[1]{
\vspace*{0.5cm}
\begin{flushright}
\small{In compliance with ... I hereby authorize the recipient of this document to use and process my personal details for the purpose of recruiting and selecting staff ...}


\end{flushright}

\begin{pspicture}    
		\rput(10,9){Jose C Martin}
	\rput(10,8.3){\includegraphics[width=0.2\textwidth]{#1}} % png signature
\end{pspicture}	

\vspace*{-7cm}
\begin{flushright}
Thamesford, \today.
\end{flushright}
}
