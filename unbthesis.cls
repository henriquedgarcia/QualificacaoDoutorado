\ProvidesClass{unbthesis}

\DeclareOption{bsc}{%
  \let\@degreetype=0}

\DeclareOption{msc}{%
  \let\@degreetype=1}

\DeclareOption{phd}{%
  \let\@degreetype=2}

\ExecuteOptions{msc}
\ProcessOptions

\LoadClass[12pt,a4paper,twoside,openany]{book}

%\RequirePackage[brazil]{babel}
\RequirePackage{calc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{theorem}
\RequirePackage{xspace}

%%%% MAIN CODE

%% Page layout
\setlength{\topmargin}{0mm}
\setlength{\textheight}{\paperheight-\headheight-\headsep-\footskip-2in}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\marginparsep}{0mm}
\setlength{\textwidth}{\paperwidth-2in}

%% Fonts
\font\quotefont=cmssq8 scaled\magstep1
\font\quotefonti=cmssqi8 scaled\magstep1

%% School identification
%% School identification

\def\university#1{%
  \gdef\@university{#1}}
\def\@university{Universidade de Brasília}

\def\universitylogo{logo.tex}

\let\@showinstitute=0
\def\institute#1{%
  \let\@showinstitute=1
  \gdef\@institute{#1}}

\let\@showdepartment=0
\def\department#1{%
  \let\@showdepartment=1
  \gdef\@department{#1}}

\def\program#1{%
  \gdef\@program{#1}}
\def\@program{Programa não-especificado}

\def\majorfield#1{%
  \gdef\@majorfield{#1}}
\def\@majorfield{Área não especificada}

\def\address#1{%
  \gdef\@address{#1}}
\def\@address{Brasília}

\def\knowledgearea#1{%
  \gdef\@knowledgearea{#1}}
\def\@knowledgearea{Área não especificada}


%% Authors identification

\def\author#1{%
  \gdef\@author{#1}}
\def\@author{Autor não especificado}

\def\adviser{%
  \@ifnextchar [%
    {\@padviser}%
    {\@padviser[\@empty]}}
\def\@padviser[#1]#2{%
  \ifx#1\@empty
    \gdef\@advisertitle{Orientador}
  \else
    \gdef\@advisertitle{Orientadora}
  \fi
  \gdef\@adviser{#2}}
\def\@author{Orientador não especificado}

\let\@showcoadviser=0
\def\coadviser{%
  \@ifnextchar [%
    {\@pcoadviser}%
    {\@pcoadviser[\@empty]}}
\def\@pcoadviser[#1]#2{%
  \let\@showcoadviser=1
  \ifx#1\@empty
    \gdef\@coadvisertitle{Co-orientador}
  \else
    \gdef\@coadvisertitle{Co-orientadora}
  \fi
  \gdef\@coadviser{#2}}


%% Work identification

\def\title#1{%
  \gdef\@title{#1}}
\def\@title{Título não especificado}

\def\@bachelordissertation{\uppercase{Trabalho de Graduação}}
\def\@mastersdissertation{\uppercase{Dissertação de Mestrado}}
\def\@phdthesis{\uppercase{Tese de Doutorado}}
\def\@texttype{%
  \if\@degreetype0
    \@bachelordissertation
  \else\if\@degreetype1
    \@mastersdissertation
  \else\if\@degreetype2
    \@phdthesis
  \fi\fi\fi}

\def\@bachelordegree{Bacharel}
\def\@mastersdegree{Mestre}
\def\@phddegree{Doutor}
\def\@degree{%
  \if\@degreetype0
    \@bachelordegree
  \else\if\@degreetype1
    \@mastersdegree
  \else\if\@degreetype2
    \@phddegree
  \fi\fi\fi}

%% Frontpage

\def\frontpage{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \begin{minipage}{160mm}
        \begin{center}
            \large
            \@university\\
            \if\@showinstitute1 \@institute\fi\\
            %\if\@showdepartment1 \@department\fi\\
            Programa de \@program\\
            \vskip 30mm
            {\LARGE \bfseries \@title}
            \vskip 30mm
            {\large \bfseries \@author}
            \vskip 20mm
        \end{center}
    \end{minipage}

    \begin{flushright}
        \begin{minipage}{120mm}
        {\sf
        \textit{\mdseries Dissertação de Mestrado submetida à Coordenação do Programa de
        \@program\ da \@university\ como requisito parcial para obtenção do
        grau de \@degree\ em Ciências no domínio da \@majorfield.}
        }
        \end{minipage}
    \end{flushright}
    
    \vskip 15mm
    \begin{center}
        {\large Área de Conhecimento:  \@knowledgearea}
    \end{center}
    \vskip 20mm
    {\large \@advisertitle: \@adviser}
    \vskip 20mm
    {\small \@address\\ \copyright \@author, \@date}
  \end{center}}

%% Presentation page

\def\presentationpage{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \begin{minipage}{140mm}
        \begin{center}
            \vskip\baselineskip
            {\Large \bfseries \@title}
        \end{center}
    \end{minipage}        
  \vskip 20mm
  {\large \@author}
  \vskip 20mm
  \begin{center}
    \begin{minipage}{120mm}
        \begin{center}
        {\sf
            \textit{\mdseries Dissertação julgada como adequada a obtenção do grau de 
            \@degree\ em \@majorfield, Área de Concentração em \@knowledgearea, 
            e aprovada em sua forma final pelo Programa de \@program da \@university}
        }   
        \end{center}
    \end{minipage}
  \end{center}

  \vskip 20mm  
  \begin{flushleft}
  Banca Examinadora:
  \end{flushleft}
  \vskip 5mm

  {
  \fontsize{11}{13}\selectfont
  \begin{center}
  \noindent
  \rule{75mm}{0.2mm}\\
  {\bfseries \@adviser}\\
  Orientador
  \end{center}
  }

  \vskip 10mm  
  {
  \fontsize{11}{13}\selectfont
  \begin{center}
  \noindent
  \rule{75mm}{0.2mm}\\
  {\bfseries Fulano da Silva}\\
  Componente da Banca
  \end{center}
  }
  
  \vskip 10mm  
  {
  \fontsize{11}{13}\selectfont
  \begin{center}
  \noindent
  \rule{75mm}{0.2mm}\\
  {\bfseries Fulano da Silva}\\
  Componente da Banca
  \end{center}
  }

  \vskip 10mm  
  {
  \fontsize{11}{13}\selectfont
  \begin{center}
  \noindent
  \rule{75mm}{0.2mm}\\
  {\bfseries Fulano da Silva}\\
  Componente da Banca
  \end{center}
  }

  \vskip 15mm    
  {\small \MakeUppercase{\@address}}\\
  {\small \MakeUppercase{\@date}} 
\end{center}}

%% Dedicatory

\def\dedicatory{
  \sf
  \itshape
  %\cleardoublepage
  \thispagestyle{empty}
  ~\\
  \vfill
  \begin{flushright}
     \begin{minipage}{90mm}}
\def\enddedicatory{
    \end{minipage}
  \end{flushright}}


%% Acknowledgements

\def\acknowledgementsname{Agradecimentos}
\def\acknowledgements{%
  \chapter*{\acknowledgementsname}}

%% Resumo

\def\resumoname{Resumo}
\def\resumo{%
  \gdef\@keywordsname{\keywordsnamePT}
  \chapter*{\resumoname}}

%% Abstract

\def\abstrname{Abstract}
\def\abstract{%
  \gdef\@keywordsname{\keywordsnameEN}
  \chapter*{\abstrname}}

%% Keywords
\def\keywordsnamePT{\sf Palavras-chave}
\def\keywordsnameEN{Keywords}
\def\@keywordsname{\@defaultkeywordsname}
\def\keywords{%
  \par\vskip\baselineskip\noindent{\sf \@keywordsname: }}
\def\endkeywords{}

%% Quotations

\def\epigraph{%
  \cleardoublepage
  \thispagestyle{empty}
  ~\\\vfill
  \begin{quotation}}
\def\endepigraph{\end{quotation}}

\def\quotation{%
  \@ifnextchar [%
    {\begin{pquot@tion}}%
    {\begin{pquot@tion}[\@empty]}}
\def\endquotation{\end{pquot@tion}}

\def\pquot@tion[#1]#2{%
  \gdef\@qauthor{#2}
  \gdef\@qnote{#1}
  \begin{flushright}
    \begin{minipage}{0.8\textwidth}
      \begin{flushright}\quotefonti}
\def\endpquot@tion{%
        \vskip.2\baselineskip%
        \quotefont---\MakeUppercase{\@qauthor}
        \if\@qnote\@empty
          \relax
        \else
          \space(\@qnote)
        \fi
      \end{flushright}
    \end{minipage}
  \end{flushright}
  \normalfont\vskip\baselineskip}

%% Table of contents

\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  \@starttoc{toc}}

%% DEFINICAO DA TOC
\def\l@part#1#2{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large\sf\bfseries #1\hfil \hb@xt@\@pnumwidth{\hss}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\def\l@chapter#1#2{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode %\sffamily\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      %\vskip .1\baselineskip
      {\sffamily\bfseries #1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \vskip .6\baselineskip
      \penalty\@highpenalty
    \endgroup
  \fi}

\setcounter{tocdepth}{4}

%% Sectioning

\setcounter{secnumdepth}{4}

\def\part{%
  \cleardoublepage%
  \thispagestyle{empty}%
  \secdef\@part\@spart}
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}\sf#1}%
    \else
      \addcontentsline{toc}{part}{\sf#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \null\vfil
     \ifnum \c@secnumdepth >-2\relax
       \Large\sf \MakeUppercase{\partname\nobreakspace\thepart}
       \par
       \vskip 20\p@
     \fi
     \huge\bfseries\MakeUppercase{\sf#2}\par}
     \vfil}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \null\vfil
     \huge\sf\bfseries\MakeUppercase{\sf#1}\par}
     \vfil}

\def\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    {\thispagestyle{empty}}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{
   \refstepcounter{chapter}%
   \addcontentsline{toc}{chapter}{\chaptername~\thechapter\mbox{\hspace{2mm}}--\mbox{\hspace{2mm}}#1}%
   \chaptermark{#1}%
   \addtocontents{lof}{\protect\addvspace{10\p@}}%
   \addtocontents{lot}{\protect\addvspace{10\p@}}%
   \@makechapterhead{#2}%
   \@afterheading}

\def\@makechapterhead#1{%
  {\noindent\sffamily\large\MakeUppercase{\chaptername~\thechapter}}%
  \vskip 2\baselineskip%
  {\begin{flushright}\Large\sffamily\bfseries\MakeUppercase{#1}\end{flushright}}%
  %\vskip 1.5\baselineskip}
  \vskip 1.7\baselineskip} %MODIFICAÇÕES KLEBER: PARA PODER AJUSTAR CORRETAMENTE O TAMANHO DO TEXTO DA DISSERTAÇÃO

\def\@schapter#1{%
  \chaptermark{#1}%
  \@makeschapterhead{#1}%
  \@afterheading}

\def\@makeschapterhead#1{%
  {\noindent\sffamily\large\MakeUppercase{~}}%
  \vskip 2\baselineskip%
  {\begin{flushright}\Large\sffamily\bfseries\MakeUppercase{#1}\end{flushright}}
  \vskip 1.5\baselineskip}

\def\appendix{%
   \setcounter{chapter}{0}%
   \renewcommand{\thechapter}{\Alph{chapter}}%
   \renewcommand{\chaptername}{\appendixname}}

\def\section{%
  \@startsection{section}{1}{0mm}{\baselineskip}
    {.625\baselineskip}{\sffamily\bfseries\MakeUppercase}}

\def\subsection{%
  \@startsection{subsection}{2}{0mm}{\baselineskip}
    {.6\baselineskip}{\sffamily\bfseries}}

\def\subsubsection{%
  \@startsection{subsubsection}{3}{0mm}{1.2\baselineskip}
   {0.5em}{\rm\bfseries}}
   
\def\paragraph{%
  \@startsection{paragraph}{4}{0mm}{\baselineskip}
   {-1em}{\itshape}}

\def\colophon{%
  \cleardoublepage
  \thispagestyle{empty}
  \null\vfill
  \small\noindent
  Este texto foi tipografado em \LaTeX\ na classe \textsf{unbthesis}
  (\textsf{ppgee.unb.br/\textasciitilde paguso/unbthesis}).
  A fonte do corpo do texto é a Computer Modern Roman 12pt.
}

% Headings & footers

%\def\chaptermark#1{\markboth{\sc\MakeLowercase{#1}}{\sc\MakeLowercase{Chapter \thechapter:  #1}}}
%\def\sectionmark#1{\markright{\sc\MakeLowercase{\thesection\ #1}}}


%\def\chaptermark#1{
%    \markright {\slshape\MakeUppercase{
%        \ifnum \c@secnumdepth >\m@ne
%        \if@mainmatter
%            \@chapapp\ \thechapter: \
%        \fi
%        \fi
%        #1}}}     

%% Tables and figures

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  %\sbox\@tempboxa{\small\bf #1.\rm\ #2}%
  \sbox\@tempboxa{\footnotesize\bf #1.\rm\ #2}%
  \ifdim \wd\@tempboxa >\hsize
    %{\small\bf#1.\rm\ #2\par}
    {\footnotesize \bf#1. \rm  #2\par}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%% Lists

%\def\theenumi{\roman{enumi}}
%\def\labelenumi{\theenumi)}
%\def\theenumii{\alph{enumii}}
%\def\labelenumii{\theenumii.}

\newcommand\sitemizelabel{$\bullet$}
\def\sitemize{%
  \begin{list}{}%
    {\renewcommand{\makelabel}{\makebox[\labelwidth][r]{\sitemizelabel}}%
     \setlength{\leftmargin}{2.5em}
     \setlength{\itemsep}{0pt}%
     \setlength{\parsep}{0pt}%
     \setlength{\topsep}{.5\topsep}}}
\def\endsitemize{\end{list}}

\newcounter{senumeratecounter}
\newcommand{\senumeratelabel}{\stepcounter{senumeratecounter}\roman{senumeratecounter})}
\def\senumerate{%
  \setcounter{senumeratecounter}{0}%
  \begin{list}{}%
    {\renewcommand{\makelabel}{\makebox[\labelwidth][r]{\senumeratelabel}}%
     \setlength{\leftmargin}{2.5em}
     \setlength{\itemsep}{0pt}%
     \setlength{\parsep}{0pt}%
     \setlength{\topsep}{.5\topsep}}}
\def\endsenumerate{\end{list}}


%% Mathematics

% Equation numbering
%\renewcommand{\theequation}{\oldstylenums{\arabic{chapter}}.\oldstylenums{\arabic{equation}}}
%\renewcommand{\theequation}{{{\sf\arabic{chapter}}}.{{\sf\arabic{equation}}}}

% Theorem-like environments
\theoremstyle{plain}
\theorembodyfont{\rmfamily\slshape}
\newtheorem{Axi}{Axiom}[chapter]
\newtheorem{Conj}{Conjecture}[chapter]
\newtheorem{Def}{Definition}[chapter]
\newtheorem{Lem}{Lemma}[chapter]
\newtheorem{Theo}{Theorem}[chapter]
\newtheorem{Prop}{Proposition}[chapter]
\newtheorem{Cor}{Corolary}[chapter]
\newenvironment{Proof}{\noindent{\textit{Prova}}\ }{\qed\vskip2\parsep}
\newenvironment{IProof}{\noindent{\textit{Prova}}\ }{\vskip2\parsep}
\newcommand{\qed}{\rule{3pt}{8pt}}

% Useful reference macros
\newcommand{\figref}[1]{Figure \ref{#1}\xspace}
\newcommand{\tabref}[1]{Table \ref{#1}\xspace}
\newcommand{\eqnref}[1]{equation \eqref{#1}\xspace}
\newcommand{\chapref}[1]{Chapter \ref{#1}\xspace}
\newcommand{\secref}[1]{Section \ref{#1}\xspace}
\newcommand{\appref}[1]{Appendix  \ref{#1}\xspace}
\newcommand{\axiref}[1]{Axiom \ref{#1}\xspace}
\newcommand{\conjref}[1]{Conjecture \ref{#1}\xspace}
\newcommand{\defref}[1]{Definition \ref{#1}\xspace}
\newcommand{\lemref}[1]{Lemma \ref{#1}\xspace}
\newcommand{\theoref}[1]{Theorem \ref{#1}\xspace}
\newcommand{\corref}[1]{Corolary \ref{#1}\xspace}
\newcommand{\propref}[1]{Proposition \ref{#1}\xspace}
\newcommand{\pgref}[1]{page \pageref{#1}\xspace}
