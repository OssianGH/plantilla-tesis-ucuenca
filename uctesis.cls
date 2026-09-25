% -----------------------------------------------------------------------------
% Archivo: uctesis.cls
% Descripcion: Clase LaTeX para trabajos de titulacion de la Universidad de Cuenca
% Autor: Oscar Idrovo
% Fecha: 2026-06-27
% Version: 1.0
% -----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uctesis}[2026/06/27 Tesis UCuenca]

\LoadClass{report}

\RequirePackage{fontspec}
\setmainfont{Arial}
\setsansfont{Arial}
\setmonofont{Courier New}

\RequirePackage{polyglossia}
\setdefaultlanguage{spanish}

\DeclareMathSizes{11}{11}{8}{6}
\RequirePackage{tabularx}
\RequirePackage[normalem]{ulem}
\RequirePackage{ragged2e}
\RequirePackage{microtype}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[
  top=1 in,
  bottom=1 in,
  left=1 in,
  right=1 in,
]{geometry}
\RequirePackage{titlesec}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{enumitem}
\RequirePackage{fontawesome5}
\RequirePackage{amsmath}
\RequirePackage[pscoord]{eso-pic}
\RequirePackage{calc}
\RequirePackage{changepage}
\RequirePackage{paracol}
\RequirePackage{ifthen}
\RequirePackage{needspace}
\RequirePackage{etoolbox}
\RequirePackage[
  colorlinks=false
]{hyperref}
\RequirePackage{orcidlink}
\RequirePackage{bookmark}

\justifying
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\AtBeginEnvironment{adjustwidth}{\partopsep0pt}
\pagestyle{empty}
\let\ps@plain\ps@empty
\setlength{\parindent}{0pt}
\setlength{\topskip}{10pt}
\setlength{\parskip}{0pt}
\setlength{\columnsep}{0.15cm}
\setlength{\belowcaptionskip}{5pt}

\definecolor{ucfooterline}{HTML}{002856}
\renewcommand{\contentsname}{Índice de contenido}
\renewcommand{\listfigurename}{Índice de figuras}
\renewcommand{\listtablename}{Índice de tablas}
\newcommand{\figurecaption}[2]{\caption[#1]{#1 #2}}
\renewcommand{\arraystretch}{1.4}

% Define a command to set the thesis faculty
\newcommand{\thesisfaculty}[1]{\def\@thesisfaculty{#1}}
\def\@thesisfaculty{}

% Define a command to set the thesis type
\newcommand{\thesistype}[1]{\def\@thesistype{#1}}
\def\@thesistype{}

% Define a command to set the thesis title
\newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
\def\@thesistitle{}

% Define a command to set the thesis degree
\newcommand{\thesisdegree}[1]{\def\@thesisdegree{#1}}
\def\@thesisdegree{}

% Define a command to set the thesis author(s)
\newcommand{\thesisauthor}[1]{\def\@thesisauthor{#1}}
\def\@thesisauthor{}

\newif\ifuc@hassecondauthor
\uc@hassecondauthorfalse
\newcommand{\thesissecondauthor}[1]{%
  \uc@hassecondauthortrue%
  \def\@thesissecondauthor{#1}%
}
\def\@thesissecondauthor{}

\newcommand{\thesisyear}[1]{\def\@thesisyear{#1}}
\def\@thesisyear{}

\newcommand{\thesismonth}[1]{\def\@thesismonth{#1}}
\def\@thesismonth{}

\newcommand{\thesisday}[1]{\def\@thesisday{#1}}
\def\@thesisday{}

% Define a command to set the thesis director(s)
\newcommand{\thesisdirector}[2]{%
  \def\@thesisdirectorname{#1}%
  \def\@thesisdirectororcid{#2}%
}
\def\@thesisdirectorname{}
\def\@thesisdirectororcid{}

\newif\ifuc@hasseconddirector
\uc@hasseconddirectorfalse
\newcommand{\thesisseconddirector}[2]{%
  \uc@hasseconddirectortrue%
  \def\@thesisseconddirectorname{#1}%
  \def\@thesisseconddirectororcid{#2}%
}
\def\@thesisseconddirectorname{}
\def\@thesisseconddirectororcid{}

% Convenience helper for director ORCID badges
\newcommand{\directororcid}[1]{\orcidlinkc{#1}}

\newcommand{\uc@printdirector}[2]{%
  #1\par%
  \ifstrempty{#2}{}{%
    \vspace*{13.6pt}%
    ORCID: \directororcid{#2}\par%
  }%
}

\newcommand{\uc@printauthors}{%
  \@thesisauthor\par%
  \ifuc@hassecondauthor%
    \vspace*{10pt}%
    \@thesissecondauthor\par%
  \fi%
}

\newcommand{\uc@pdfauthors}{%
  \@thesisauthor%
  \ifuc@hassecondauthor\space-\space\@thesissecondauthor\fi%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chapter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Configure numbered chapter
\titleformat{\chapter}[block]{%
  \centering\bfseries\fontsize{11pt}{13pt}\selectfont\setlength{\parskip}{0pt}%
}{\thechapter.}{0.5em}{}%
\titlespacing{\chapter}{0pt}{-10pt}{-7pt}

% Configure unnumbered chapter
\titleformat{name=\chapter,numberless}[block]{%
  \centering\bfseries\fontsize{11pt}{13pt}\selectfont\setlength{\parskip}{0pt}%
}{}{0pt}{}%
\titlespacing{name=\chapter,numberless}{0pt}{-10pt}{-7pt}

% Configure section and subsection headings
\titleformat{\section}[block]{\bfseries}{\thesection.}{0.5em}{}%
\titleformat{\subsection}[block]{\bfseries}{\thesubsection.}{0.5em}{}%
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}

% Ensure unnumbered chapters are included in the table of contents
\let\old@schapter\@schapter
\def\@schapter#1{%
  \phantomsection%
  \addcontentsline{toc}{chapter}{#1}%
  \old@schapter{#1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\uc@pagelogo}{%
  \AtPageUpperLeft{%
    \hspace*{61pt}%
    \raisebox{-72pt}[0pt][0pt]{%
      \includegraphics[height=0.57in]{content/logos/ucuenca.png}%
    }%
  }%
}

\newcommand{\uc@pagenumber}{%
  \AtPageUpperLeft{%
    \hspace*{\dimexpr\paperwidth-72pt\relax}%
    \raisebox{-59pt}[0pt][0pt]{%
      \makebox[0pt][r]{\fontsize{11pt}{13pt}\selectfont\thepage}%
    }%
  }%
}

\newcommand{\uc@footerline}{%
  \AtPageLowerLeft{%
    \hspace*{\dimexpr(\paperwidth-\textwidth)/2\relax}%
    \raisebox{59pt}[0pt][0pt]{%
      {\color{ucfooterline}\rule{\textwidth}{0.5pt}}%
    }%
  }%
}

\newcommand{\uc@footerauthor}{%
  \AtPageLowerLeft{%
    \hspace*{72pt}%
    \raisebox{38pt}[0pt][0pt]{%
      \fontsize{11pt}{13pt}\selectfont%
      \uc@pdfauthors%
    }%
  }%
}

\AddToShipoutPictureFG{%
  \ifnum\value{page}>1\relax%
    \uc@pagelogo%
    \uc@pagenumber%
    \uc@footerline%
    \uc@footerauthor%
  \fi%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\maketitlepage}{%
    {%
      \centering%
      \vspace*{-9.8pt}%
      \includegraphics[height=91.1pt]{content/logos/ucuenca.png}\par%
      \vspace*{-0.6pt}%
      {\fontsize{18pt}{32.4pt}\selectfont\bfseries Universidad de Cuenca\par}%
      \vspace*{12.5pt}%
      {\fontsize{14pt}{25.2pt}\selectfont Facultad de \@thesisfaculty\par}%
      \vspace*{8.8pt}%
      {\fontsize{14pt}{25.2pt}\selectfont \@thesistype\par}%
      \vspace*{17.5pt}%
      {\fontsize{12pt}{14.4pt}\selectfont\bfseries\@thesistitle\par}%
    }
    \vspace*{36.6pt}%
    \begin{adjustwidth}{285pt}{0pt}%
      \pretolerance=10000%
      \justifying\fontsize{11pt}{13pt}\selectfont%
      Trabajo de titulación previo a la obtención del título de \@thesisdegree\par%
    \end{adjustwidth}%
    \vspace*{57pt}%
    {
      \fontsize{11pt}{13pt}\selectfont%
      \ifuc@hassecondauthor%
        {\bfseries Autores:}\par%
      \else%
        {\bfseries Autor:}\par%
      \fi%
      \vspace*{10pt}%
      \uc@printauthors%
      \vspace*{31.6pt}%
      \ifuc@hasseconddirector%
        {\bfseries Directores:}\par%
        \vspace*{9pt}%
        \uc@printdirector{\@thesisdirectorname}{\@thesisdirectororcid}%
        \vspace*{14pt}%
        \uc@printdirector{\@thesisseconddirectorname}{\@thesisseconddirectororcid}%
      \else%
        {\bfseries Director:}\par%
        \vspace*{9pt}%
        \uc@printdirector{\@thesisdirectorname}{\@thesisdirectororcid}%
      \fi%
      \vspace*{\fill}%
      {
        \centering
        {\bfseries Cuenca, Ecuador\par}%
        \vspace*{10pt}%
        \@thesisyear-\@thesismonth-\@thesisday\par%
      }
      \vspace*{40.9pt}%
    }%
  \newpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Summary pages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\uc@summaryheader}[4]{%
  \chapter*{#1}%
  {%
    \setlength{\parskip}{10pt}%
    \fontsize{11pt}{19pt}\selectfont%
    #2\par%
    \hspace*{0.5in}\textit{#3:} #4\par%
  }
}

\newcommand{\uc@summaryfooter}[2]{%
  \vfill%
  \href{%
    https://creativecommons.org/licenses/%
  }{\includegraphics[height=18pt]{content/logos/creative-commons.pdf}}
  \hspace*{12pt}%
  \includegraphics[height=25pt]{content/logos/by-nc.pdf}\par%
  \vspace*{8pt}%
  {%
    \setlength{\parskip}{10pt}%
    \fontsize{9pt}{10pt}\selectfont #1\par%
    \vspace*{1.8pt}%
    \textbf{#2:} \href{%
      https://dspace.ucuenca.edu.ec/%
    }{\uline{https://dspace.ucuenca.edu.ec/}}\par%
  }%
  \vspace*{25pt}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resumen page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thesisresumen}[1]{\def\@resumen{#1}}
\def\@resumen{}

\newcommand{\resumenkeywords}[1]{\def\@resumenkeywords{#1}}
\def\@resumenkeywords{}

\newcommand{\makeresumenpage}{%
  \uc@summaryheader{Resumen}{\@resumen}{Palabras clave del autor}{\@resumenkeywords}%
  \uc@summaryfooter{%
    El contenido de esta obra corresponde al derecho de expresión de los autores y no
    compromete el pensamiento institucional de la Universidad de Cuenca ni desata su
    responsabilidad frente a terceros. Los autores asumen la responsabilidad por la
    propiedad intelectual y los derechos de autor.%
  }%
  {Repositorio Institucional}%
  \newpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thesisabstract}[1]{\def\@abstract{#1}}
\def\@abstract{}

\newcommand{\abstractkeywords}[1]{\def\@abstractkeywords{#1}}
\def\@abstractkeywords{}

\newcommand{\makeabstractpage}{%
  \uc@summaryheader{Abstract}{\@abstract}{Author Keywords}{\@abstractkeywords}%
  \uc@summaryfooter%
  {%
    The content of this work corresponds to the right of expression of the authors and
    does not compromise the institutional thinking of the University of Cuenca, nor
    does it release its responsibility before third parties. The authors assume
    responsibility for the intellectual property and copyrights.%
  }%
  {Institutional Repository}%
  \newpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Index pages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makeindexpages}{%
  {
    \fontsize{11pt}{19pt}\selectfont%
    \tableofcontents%
    \listoffigures%
    \listoftables%
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% References %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\uc@printreferences}{%
  \renewcommand{\bibname}{Referencias}%
  \bibliographystyle{IEEEtran}%
  \bibliography{references}%
}

\newbool{uc@referencesprinted}
\boolfalse{uc@referencesprinted}

\newcommand{\uc@ensurereferences}{%
  \ifbool{uc@referencesprinted}{}{%
    \uc@printreferences%
    \booltrue{uc@referencesprinted}%
  }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Anexos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newbool{uc@anexosstarted}
\boolfalse{uc@anexosstarted}

\newcounter{anexo}
\renewcommand{\theanexo}{\Alph{anexo}}

\newcommand{\printanexos}{%
  \uc@ensurereferences%
  \ifnum\value{anexo}>0\relax%
    \ifbool{uc@anexosstarted}{}{%
      \chapter*{Anexos}%
      \booltrue{uc@anexosstarted}%
    }%
  \fi%
}

\newcommand{\anexo}[1]{%
  \ifnum\value{anexo}>0\relax\clearpage\fi%
  \refstepcounter{anexo}%
  \printanexos%
  \phantomsection%
  \addcontentsline{toc}{section}{Anexo \theanexo\ifstrempty{#1}{}{. #1}}%
  {\bfseries Anexo \theanexo\ifstrempty{#1}{}{. #1}\par}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document embeds %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{%
  \hypersetup{%
    pdftitle={\@thesistitle},
    pdfauthor={\uc@pdfauthors}%
  }%
  \maketitlepage%
  \makeresumenpage%
  \makeabstractpage%
  \makeindexpages%
  \setlength{\parskip}{10pt}%
  \fontsize{11pt}{19pt}\selectfont%
}

\AtEndDocument{%
  \uc@ensurereferences%
  \printanexos%
}
