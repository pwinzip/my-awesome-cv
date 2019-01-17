\ProvidesClass{awesome-cv}[2018/12/21 CV class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------
%               Class options        
%-------------------------------------------
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass[11pt, a4paper]{article}


%-------------------------------------------
%     Commands for personal information
%-------------------------------------------

% Define applicant's name
\newcommand*{ \name }[2]{ \def\@firstname{#1}\def\@lastname{#2} }
\newcommand*{ \firstname }[1]{ \def\@firstname{#1} }
\newcommand*{ \lastname }[1]{ \def\@lastname{#1} }

% Define applicant's address
\newcommand*{ \address }[1]{ \def\@address{#1} }

% Define applicant's mobile
\newcommand*{ \mobile }[1]{ \def\@mobile{#1} }

% Define applicant's email
\newcommand*{ \email }[1]{ \def\@email{#1} }

% Define applicant's gender
\newcommand*{ \gender }[1]{ \def\@gender{#1} }

% Define applicant's dob
\newcommand*{ \dob }[1]{ \def\@dob{#1} }

% Define applicant's nationality
\newcommand*{ \nationality }[1]{ \def\@nationality{#1} }

% Define applicant's religion
\newcommand*{ \religion }[1]{ \def\@religion{#1} }

% Define applicant's marital status
\newcommand*{ \status }[1]{ \def\@status{#1} }



%-------------------------------------------
%              3rd party packages
%-------------------------------------------
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{tikz}
% Page size and margin
\RequirePackage{geometry}
% Header style
\RequirePackage{fancyhdr}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to manage fonts
\RequirePackage[T1]{fontenc}
% Needed to use icons from font-awesome
\RequirePackage{fontawesome}
% Needed to use dashed line for divider
\RequirePackage{dashrule}



%-------------------------------------------
%         Configuration for layout
%-------------------------------------------
\geometry{left=0.5in, top=0.5in, right=0.5in, bottom=0.5in,nohead,nofoot}

\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}



%-------------------------------------------
%         Commands for utilities
%-------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific tickness
\def\vhrulefill#1{\leavevmode\leaders\hrule height #1\hfill \kern\z@}

% Define separator for informations in header
% Usage: \headersep{<separator>}
\newcommand*{\headersep}[1][\quad\textbar\quad]{\def\@headersep{#1}}
\headersep


\newcommand{\cvtag}[1]{%
	\tikz[baseline]\node[anchor=base,draw=text!30,rounded corners,inner xsep=1ex,inner ysep = 0.75ex, yshift=2ex, text height=1.5ex,text depth=.25ex]{\objectivestyle{#1}};
}

%\newcommand{\ratingmarker}{\faCircle}
%\newcommand{\cvskill}[2]{%
%	\textcolor{text}{\bodyfont\textbf{#1}}\hfill
%	\foreach \x in {1,...,5}{%
%		\space{\ifnumgreater{\x}{#2}{\color{graytext!30}}{\color{awesome}}\ratingmarker}}\par%
%}
%\newcommand{\cvskillbar}[1]{%
%	\begin{tikzpicture}[scale=0.6]
%	\foreach [count=\i] \x/\y in {#1}
%	{
%		\draw[fill=lightgray,lightgray] (4,\i) rectangle (10,\i+0.4);
%		\draw[fill=white,awesome](4,\i) rectangle (4+\y,\i+0.4);
%		\node [above right ] at (0,\i-0.4) {\objectivestyle{\x}};
%	}
%	\end{tikzpicture}
%}

% Define skill bar: max = 6
% Usage: \cvskillbarx{<skill>}{<value>}
\newcommand{\cvskillbarx}[2]{%
	\begin{tikzpicture}[scale=0.6]
		\draw[fill=lightgray,lightgray] (0,0) rectangle (6,0.4);
		\draw[fill=awesome,awesome](0,0) rectangle (#2,0.4);
		\node [above right ] at (0,0+0.4) {\objectivestyle{#1}};	
	\end{tikzpicture}
	\hfill
}

\newcommand{\divider}{\textcolor{graytext!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}


%-------------------------------------------
%          Configuration for color
%-------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-mainblue}{HTML}{28517d}

\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}

\colorlet{awesome}{awesome-mainblue}

\newcommand*{\getcolor}{%
	\color{%
		\ifcase\value{colorCounter}%
		awesome\or%
		awesome\or%
		awesome\or%
		awesome\or%
		awesome\else%
		awesome\fi%
	}%
}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
	{%
		\getcolor#1#2#3%
	}%
	\stepcounter{colorCounter}%
}




%-------------------------------------------
%           Configuration for fonts
%-------------------------------------------
\newcommand*{\fontdir}[1][Fonts/]{\def\@fontdir{#1}}
\fontdir

\newfontfamily\headerfont[
Path= \@fontdir,
UprightFont=*-Regular,
ItalicFont=*-Italic,
BoldFont=*-Bold,
BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
Path= \@fontdir,
UprightFont=*-Thin,
ItalicFont=*-ThinItalic,
BoldFont=*-Medium,
BoldItalicFont=*-MediumItalic,
]{Roboto}

\newfontfamily\footerfont[
Path= \@fontdir,
UprightFont=*-Regular,
ItalicFont=*-It,
BoldFont=*-Bold
]{SourceSansPro}

% Set font for body (default is Source Sans Pro)
\newfontfamily\bodyfont[
Path= \@fontdir,
UprightFont=*-Regular,
ItalicFont=*-It,
BoldFont=*-Bold,
BoldItalicFont=*-BoldIt
]{SourceSansPro}

\newfontfamily\bodyfontlight[
Path= \@fontdir,
UprightFont=*-Light,
ItalicFont=*-LightIt,
BoldFont=*-Semibold,
BoldItalicFont=*-SemiboldIt
]{SourceSansPro}



%-------------------------------------------
%              Customized styles
%-------------------------------------------

% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]
	{{\fontsize{32pt}{1em}\headerfontlight\color{darktext}#1}}
\newcommand*{\headerlastnamestyle}[1]
	{{\fontsize{32pt}{1em}\headerfont\bfseries\color{graytext}#1}}
\newcommand*{\headeraddressstyle}[1]
	{{\fontsize{8pt}{1em}\headerfont\itshape\color{awesome}#1}}
\newcommand*{\headercontactstyle}[1]
	{{\fontsize{8pt}{1em}\headerfont\color{graytext}#1}}
\newcommand*{\headerotherstyle}[1]
	{{\fontsize{8pt}{1em}\headerfont\color{graytext}#1}}
\newcommand*{\sectionstyle}[1]
	{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor#1}}
\newcommand*{\cvrefsection}[1]{%
	\smallskip%
	{\color{text}\bodyfont\large\bfseries{#1}\par}\medskip
}
	
% For element of entry
\newcommand*{\objectivestyle}[1]
	{{\fontsize{12pt}{1em}\bodyfont\color{text}#1}}
		
\newcommand*{\placestyle}[1]
	{{\fontsize{12pt}{1em}\bodyfont\bfseries\color{text}#1}}
\newcommand*{\locationstyle}[1]
	{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{awesome}#1}}
\newcommand*{\positionstyle}[1]
	{{\fontsize{12pt}{1em}\bodyfont\color{text}#1}}
\newcommand*{\yearstyle}[1]
	{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{text}\faCalendar~~#1}}
\newcommand*{\majorstyle}[1]
	{{\fontsize{12pt}{1em}\bodyfont\scshape\color{text}#1}}
\newcommand*{\descriptionstyle}[1]
	{{\fontsize{10pt}{1em}\bodyfont\color{graytext}#1}}


%-------------------------------------------
%   Commands for elements of CV structure
%-------------------------------------------

% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}{
	\begin{center}
		\headerfirstnamestyle {
			\@firstname
		}~~
		\headerlastnamestyle {
			\@lastname
		}
		\\
		\vspace{0.4mm}
		\ifthenelse{\isundefined{\@address}}
			{}
			{\headeraddressstyle{\faMapMarker~~~\@address\\}}
		\vspace{-0.5mm}
		\headercontactstyle{
			\newboolean{isstart}
			\setboolean{isstart}{false}
			\ifthenelse{\isundefined{\@mobile}}
				{}
				{
					\faPhone~~~\@mobile
					\setboolean{isstart}{false}
				}
			\ifthenelse{\isundefined{\@email}}
				{}
				{
					\ifbool{isstart}
						{ \setboolean{isstart}{false} }
						{ \@headersep }
					\faEnvelope~~~\@email
				}
			\\
		}
		\vspace{-0.5mm}
		\headerotherstyle{
			\newboolean{isstart}
			\setboolean{isstart}{false}
			\ifthenelse{\isundefined{\@gender}}
				{}
				{
					\faVenusMars~~~\@gender
					\setboolean{isstart}{false}
				}
			\ifthenelse{\isundefined{\@dob}}
				{}
				{
					\ifbool{isstart}
					{ \setboolean{isstart}{false} }
					{ \@headersep }
					\faBirthdayCake~~~\@dob
				}
			\\
		}
		\vspace{-0.5mm}
		\headerotherstyle{
			\newboolean{isstart}
			\setboolean{isstart}{false}
			\ifthenelse{\isundefined{\@nationality}}
				{}
				{
					Nationality:~~~\@nationality
					\setboolean{isstart}{false}
				}
			\ifthenelse{\isundefined{\@religion}}
				{}
				{
					\ifbool{isstart}
					{ \setboolean{isstart}{false} }
					{ \@headersep }
					Religion:~~~\@religion
				}
			\ifthenelse{\isundefined{\@status}}
				{}
				{
					\ifbool{isstart}
					{ \setboolean{isstart}{false} }
					{ \@headersep }
					Marital status:~~~\@status
				}
			\\
		}		
	\end{center}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{
	\par\addvspace{5.5ex}
	\raggedright
	\sectionstyle{#1}
	\color{awesome}\vhrulefill{1.2pt}
	\par\nobreak\addvspace{1ex}
}


% Define an environment for cventry
\newenvironment{cventries}{
	\begin{center}
}
{
	\end{center}
}

% Define an environment for cvobjective
% Usage: \cvobjective{<text>}
\newcommand*{\cvobjective}[1]{
	\raggedright 
	\objectivestyle{#1}
}



% Define an environment for cvobjective
% Usage: \cvedcution{<university>}{<location>}{<degree>}{<major>}{<year>}{<desc.>}
\newcommand*{\cveducation}[6]{
	\setlength\tabcolsep{0pt}
	\setlength{\extrarowheight}{0pt}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{14.8cm} R{3.2cm}}
		\placestyle{#1} & \locationstyle{#2} \\
		\positionstyle{#3}~\majorstyle{#4} & \yearstyle{#5} \\
		\multicolumn{2}{L{17cm}}{\descriptionstyle{#6}} \\
	\end{tabular*}\\
	\addvspace{1ex}
}


\newcommand*{\cvexperience}[5]{
	\setlength\tabcolsep{0pt}
	\setlength{\extrarowheight}{0pt}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{14.8cm} R{3.2cm}}
		\placestyle{#1} & \locationstyle{#2} \\
		\positionstyle{#3} & \yearstyle{#4} \\%\hline
		\multicolumn{2}{L{18cm}}{\descriptionstyle{#5}} \\%\hline
	\end{tabular*}\\
	\addvspace{1ex}
}

\newenvironment{cvitem}
{
	\vspace{-7mm}
	\begin{justify}
		\renewcommand{\labelitemi}{$\bullet$}
		\begin{itemize}[leftmargin=5ex, nosep, noitemsep]
}
{
		\end{itemize}
	\end{justify}
	\vspace{-7mm}
}

\newcommand{\cvref}[4]{%
	\medskip
	\textcolor{text}{\bodyfont\textbf{#1}}\par\vspace{-0.5em}
	\begin{description}[font=\color{graytext},style=multiline,leftmargin=1.35em]
		\item[\bodyfont\faEnvelope] \bodyfont\color{graytext}#2
		\item[\bodyfont\faAt] \bodyfont\color{graytext}#3
	\end{description}
	\vspace{-0.5em}
	\bodyfont\color{graytext}#4
}



%-------------------------------------------
%               Bibliography  
%-------------------------------------------

\RequirePackage[backend=biber, style=verbose, maxnames=5, minnames=3, sorting=ydnt, date=year]{biblatex}

\DeclareNameAlias{author}{first-last}

\newcommand{\itemmarker}{\color{text}\large\textbullet}
\renewcommand{\bibfont}{\fontsize{12pt}{16pt}\color{text}\bodyfont}

\newcommand{\printinfo}[2]{\mbox{\textcolor{text}{\bodyfont #1}\hspace{0.5em}#2\hspace{2em}}}


\DeclareFieldFormat[article,inbook,incollection,inproceedings,patent,thesis,unpublished]{title}{#1}


\defbibheading{pubtype}{\cvrefsection{#1}}
\renewcommand{\bibsetup}{\vspace*{-\baselineskip}}
\AtEveryBibitem{\makebox[\bibhang][l]{\itemmarker}}
\setlength{\bibitemsep}{0.25\baselineskip}

\DeclareFieldFormat[article]{volume}{Vol. #1}
\DeclareFieldFormat[article]{number}{ No. #1}

\newcommand{\printbibsection}[3]{
	\begin{refsection}
		\nocite{*}
		\printbibliography[type=#1, title={\printinfo{#2}{#3}}, heading=pubtype]
	\end{refsection}
}

\RequirePackage{engord}