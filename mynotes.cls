% vim: set ft=tex:
\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{mynotes}[2022/10/10 LaTeX package for my own purpose]

% ---------- Options ----------

\newif\if@serif
\DeclareOption{serif}{\@seriftrue}

\newif\if@multitoc
\@multitoctrue
\DeclareOption{twocolumn}{%
  \@multitocfalse
  \PassOptionsToClass{\CurrentOption}{article}
}

% Final processing and default options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt,a4paper}
\ProcessOptions\relax
\LoadClass{article}

% ---------- Dependencies ----------

% Font setup
\RequirePackage{libertinus}
\RequirePackage[T1]{fontenc}
\RequirePackage[varqu,varl]{zi4}
\RequirePackage[amsthm]{libertinust1math}
\RequirePackage[scr=boondoxo]{mathalpha}

\RequirePackage[DIV=9]{typearea}

\RequirePackage{babel}

\RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{siunitx}

\if@multitoc
  \RequirePackage[toc]{multitoc}
  \setlength\columnseprule{.5pt}
\fi

\RequirePackage[protrusion=true,expansion=true,tracking=true,kerning=true,spacing=true]{microtype}
\frenchspacing

\RequirePackage{hyperref}

% ---------- Title ----------

\newcommand*{\titlefont}{
  \if@serif\rmfamily%
  \else\sffamily%
  \fi}

\DeclareRobustCommand*{\subject}[1]{\gdef\@subject{#1}}

\let\@subject\empty%

\def\@maketitle{%
  \newpage
  \null%
  \vskip 2em%
  \begin{center}%
  \let\footnote\thanks%
    \ifx\@subject\empty\else%
      {\large\titlefont\scshape\@subject\par}%
      \vskip .5em%
    \fi
    {\LARGE\titlefont\bfseries\@title\par}%
    \vskip 1.5em%
    {\large\titlefont%
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large\titlefont\@date}%
  \end{center}%
  \par
  \vskip 1.5em}

% ---------- Headings ----------

\newcommand*{\headingfont}{%
  \if@serif\rmfamily%
  \else\sffamily%
  \fi\bfseries}

\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus .2ex}%
  {\normalfont\Large\headingfont}}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex \@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\large\headingfont}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\headingfont}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\headingfont}}

\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\headingfont}}

% ---------- Environments ----------

\newenvironment{titlebox}[1]{%
  \noindent\hrulefill\par%
  \begin{center}\begin{minipage}{\dimexpr\linewidth-1em\relax}
  {\noindent\bfseries\sffamily #1}%
}{%
  \end{minipage}\end{center}%
  \nopagebreak\par\noindent\hrulefill%
}

% ---------- Math ----------

% Derivatives
\newcommand*{\D}{\mathop{}\!\mathrm{d}}
\newcommand*{\dd}[2]{\ensuremath{\frac{\D #1}{\D #2}}}
\newcommand*{\pd}[2]{\ensuremath{\frac{\partial{#1}}{\partial{#2}}}}

% Vectors
\renewcommand*{\vv}[1]{\ensuremath{\mathbf{#1}}}

\endinput
