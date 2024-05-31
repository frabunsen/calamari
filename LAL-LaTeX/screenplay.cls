\NeedsTeXFormat{LaTeX2e}[2003/12/01]
\ProvidesClass{screenplay}

%\setlength{\textwidth}{6.0in}
%\setlength{\widthgutter}{0in}
%\setlength{\dialwidth}{3.0in}
%\setlength{\parenwidth}{1.5in}

\DeclareOption*{%
    \PackageError{screenplay}{Unwanted option '\CurrentOption'}%
    {There are no options available for class screenplay v1.6}}
\ProcessOptions\relax
\RequirePackage{ifthen}[2001/05/26]
\LoadClass[12pt,letterpaper,onecolumn,oneside]{article}[2004/02/16]
\RequirePackage[dvips,letterpaper]{geometry}[2002/07/08]
\setlength{\paperheight}{11in}
\setlength{\paperwidth}{8.5in}
\RequirePackage[italian]{babel}
\RequirePackage{courier}[2004/09/15]
\renewcommand*{\familydefault}{\ttdefault}
\raggedright
\pagenumbering{arabic}
\pagestyle{myheadings}
\setlength{\baselineskip}{12pt plus 0pt minus 0pt}
\renewcommand*{\baselinestretch}{0.8}
\newcommand*{\dialfix}{\vspace{2pt}}
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0in}
\newcommand*{\slugspace}{\hspace{2.0em plus 0em minus 0em}}
\setlength{\evensidemargin}{0.5in}
\setlength{\oddsidemargin}{0.5in}
\setlength{\topmargin}{-0.5in}
\setlength{\headsep}{0.4in}
\setlength{\topskip}{0in}
\setlength{\textheight}{9.5in}
\setlength{\textwidth}{6.0in}
\newlength{\widthgutter}
\setlength{\widthgutter}{0.1in}
\addtolength{\textwidth}{\widthgutter}
\newlength{\dialwidth}
\setlength{\dialwidth}{3.0in}
\newlength{\dialgutter}
\setlength{\dialgutter}{0.2in}
\addtolength{\dialwidth}{\dialgutter}
\newcommand*{\dialtab}{\hspace*{1.5in}}
\newcommand*{\dialnametab}{\hspace*{1.2in}}
\newlength{\parenwidth}
\setlength{\parenwidth}{1.5in}
\addtolength{\parenwidth}{\dialgutter}
\newcommand*{\parentab}{\hspace{0.7in}}
\renewcommand*{\textfraction}{1}
\renewcommand*{\topfraction}{0}
\renewcommand*{\bottomfraction}{0}
\title{---}
\newlength{\titheadskip}
\setlength{\titheadskip}{2.25in}
\newcommand{\nicholl}{
\thispagestyle{empty}
\vspace*{\titheadskip}
\begin{center}\MakeUppercase{\@title}\end{center}
\newpage\setcounter{page}{1}
}
\author{---}
\newcommand{\@realauthor}{\@author}
\newcommand{\realauthor}[1]{\renewcommand{\@realauthor}{#1}}
\newcommand{\@address}{---}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
\newcommand{\@agent}{~}
\newcommand{\agent}[1]{\renewcommand{\@agent}{#1}}
\newlength{\titskip}
\setlength{\titskip}{3.75in plus 0in minus 1.5in}
\newlength{\addrwidth}
\setlength{\addrwidth}{2.0in}
\newlength{\addrseplen}
\setlength{\addrseplen}{2.0in plus 0in minus 0.5in}
\newcommand*{\bytext}{by}
\newcommand*{\byskip}{\baselineskip}
\newcommand{\coverpage}{
\thispagestyle{empty}
\vspace*{\titheadskip}
\begin{center}{\MakeUppercase{\@title}}\\
\vspace{\byskip}
\bytext\\
\vspace{\byskip}
\@author
\end{center}
\vspace{\titskip}
\parbox[t]{\addrwidth}{\@agent}\hspace{\addrseplen}
\parbox[t]{\addrwidth}{\@realauthor\\\@address}
\newpage\setcounter{page}{1}
}
\newcommand*{\more}{(MORE)}
\newcommand*{\contd}{(CONT'D)}
\newcommand{\paren}[1]{%

\parentab\parbox[t]{\parenwidth}{\raggedright(#1)\dialfix}\\
}
\newenvironment{dialogue}[2][]{%

\dialtab\dialnametab\hbox{\MakeUppercase{#2}}\\*
\dialtab\begin{minipage}[b]{\dialwidth}
\dialfix
\raggedright
\ifthenelse{\not\equal{#1}{}}
{
\paren{#1}
}{}
}{%
\end{minipage}

}
\newcommand{\dialbreak}[2][]{%
\nopagebreak
\dialnametab\hbox{\more}%
\end{dialogue}
\newpage
\ifthenelse{\not\equal{#1}{}}
{
\begin{dialogue}[#1]{\MakeUppercase{#2} \contd}
}{
\begin{dialogue}{\MakeUppercase{#2} \contd}
}
}
\newcommand*{\placesep}{.~}
\newcommand{\slug}[3][]{%

\MakeUppercase{#2\placesep#3}%
\ifthenelse{\not\equal{#1}{}}
                {%
\slugspace\MakeUppercase{#1}\hspace{\fill}
                }{}
\nopagebreak

}
\newcommand*{\inttext}{INT}
\newcommand{\intslug}[2][]{\slug[#1]{\inttext}{#2}}
\newcommand*{\exttext}{EXT}
\newcommand{\extslug}[2][]{\slug[#1]{\exttext}{#2}}
\newcommand*{\sepintext}{./}
\newcommand{\intextslug}[2][]{%
\slug[#1]{\inttext\sepintext\exttext}{#2}}
\newcommand{\extintslug}[2][]{%
\slug[#1]{\exttext\sepintext\inttext}{#2}}
\newcommand*{%
\sccentre}[1]{\hspace*{\fill}{#1}\hspace{\fill}\hspace{\widthgutter}}
\newcommand*{%
\scflushright}[1]{\hspace*{\fill}{#1}\hspace{\widthgutter}}
\newcommand*{\punctchar}{:}
\newcommand*{\titleovertext}{TITLE~OVER}
\newenvironment{titleover}[1][]{%

\ifthenelse{\not\equal{#1}{}}
{%
\titleovertext #1\punctchar
}{%
\titleovertext\punctchar
}%
\\*[\baselineskip]
\dialtab\begin{minipage}[b]{\dialwidth}
\raggedright
}{%
\end{minipage}

}
\newcommand{\titbreak}{%
\nopagebreak
\dialnametab\hbox{\more}%
\end{titleover}
\newpage
\begin{titleover}[\contd]%
}
\newcommand{\centretitle}[1]{%

\titleovertext\punctchar\\*[\baselineskip]%
\sccentre{#1}

}
\newcommand*{\fadeintext}{FADE~IN}
\newcommand{\fadein}{%

\fadeintext\punctchar

}
\newcommand*{\fadeouttext}{FADE~OUT}
\newcommand{\fadeout}{%

\scflushright{\fadeouttext\punctchar}

}
\newcommand*{\intercuttext}{INTERCUT~WITH}
\newcommand{\intercut}{%

\scflushright{\intercuttext\punctchar}

}
\newcommand*{\pov}{P.O.V.}
\newcommand*{\revert}{REVERSE~\pov}
\newcommand*{\thirty}{THE~END}
\newcommand{\theend}{\sccentre{\thirty}}
\newcommand{\sound}[2]{[#1]\MakeUppercase{#2}}
\newcommand{\event}[1]{\MakeUppercase{#1}}
\newcommand{\timestamp}[1]{\centering \MakeUppercase{#1}}
