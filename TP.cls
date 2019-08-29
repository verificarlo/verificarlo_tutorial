\ProvidesClass{TP}
\LoadClass[a4paper]{article}

\usepackage[a4paper,margin=1.5cm]{geometry}

\def\mdcmdlinespacing{\hspace{-1em}}

\usepackage{enumerate}
%\usepackage[ruled]{algorithm2e}
\usepackage[pdftex,hidelinks,pdfusetitle]{hyperref}
\usepackage{fontawesome}
\usepackage[framemethod=tikz]{mdframed}

\mdfdefinestyle{commandline}{
  leftmargin=10pt,
  rightmargin=10pt,
  innerleftmargin=15pt,
  middlelinecolor=black!50!white,
  middlelinewidth=2pt,
  frametitlerule=false,
  backgroundcolor=black!5!white,
  frametitle={Command line},
  frametitlefont={\normalfont\sffamily\color{white}\mdcmdlinespacing},
  frametitlebackgroundcolor=black!50!white,
  nobreak,
}
\newenvironment{commandline}{
  \begin{mdframed}[style=commandline]
}{
  \end{mdframed}
}


\def\mdfilename{File}
\mdfdefinestyle{file}{
  innertopmargin=1.6\baselineskip,
  innerbottommargin=0.8\baselineskip,
  topline=false, bottomline=false,
  leftline=false, rightline=false,
  leftmargin=2cm,
  rightmargin=2cm,
  singleextra={%
    \draw[fill=black!10!white](P)++(0,-1.2em)rectangle(P-|O);
    \node[anchor=north west]
    at(P-|O){\ttfamily\mdfilename};
    %
    \def\l{3em}
    \draw(O-|P)++(-\l,0)--++(\l,\l)--(P)--(P-|O)--(O)--cycle;
    \draw(O-|P)++(-\l,0)--++(0,\l)--++(\l,0);
  },
  nobreak,
}
\newenvironment{file}[1][Fichier]{
  \def\mdfilename{#1}
  \begin{mdframed}[style=file]
}{
  \end{mdframed}
}

\mdfdefinestyle{question}{
  innertopmargin=1.2\baselineskip,
  innerbottommargin=0.8\baselineskip,
  roundcorner=5pt,
  nobreak,
  singleextra={%
    \draw(P-|O)node[xshift=1em,anchor=west,fill=white,draw,rounded corners=5pt]{%
      Question \theQuestion\questionTitle};
  },
}
\newcounter{Question}
\newenvironment{question}[1][\unskip]{
  \bigskip
  \stepcounter{Question}
  \def\questionTitle{ #1}
  \begin{mdframed}[style=question]
  }{
  \end{mdframed}
}

\mdfdefinestyle{warning}{%
  topline=false, bottomline=false,
  leftline=false, rightline=false,
  nobreak,
  singleextra={%
    \draw(P-|O)++(-0.5em,0)node(tmp1){};
    \draw(P-|O)++(0.5em,0)node(tmp2){};
    \fill[black,rotate around={45:(P-|O)}](tmp1)rectangle(tmp2);
    \node at(P-|O){\color{white}\scriptsize\bf !};
    \draw[very thick](P-|O)++(0,-1em)--(O);%--(O-|P);
  }
}
\newenvironment{warn}[1][Attention :]{
  \begin{mdframed}[style=warning]
    \noindent{\bf #1}
}{
  \end{mdframed}
}


\mdfdefinestyle{info}{%
  topline=false, bottomline=false,
  leftline=false, rightline=false,
  nobreak,
  singleextra={%
    \fill[black](P-|O)circle[radius=0.4em];
    \node at(P-|O){\color{white}\scriptsize\bf i};
    \draw[very thick](P-|O)++(0,-0.8em)--(O);%--(O-|P);
  }
}
\newenvironment{info}[1][NB :]{
  \begin{mdframed}[style=info]
    \noindent{\bf #1}
}{
  \end{mdframed}
}



% TikZ file tree
\def\FTdir(#1,#2,#3){%
  \FTfile(#1,{{\color{black!40!white}\faFolderOpen}\hspace{0.2em}#3})
  (tmp.west)++(0.8em,-0.4em)node(#2){}
  (tmp.west)++(1.5em,0)
  ++(0,-1.3em) 
}
\def\FTfile(#1,#2){%
  node(tmp){}
  (#1|-tmp)++(0.6em,0)
  node(tmp)[anchor=west,black]{\tt #2}
  (#1)|-(tmp.west)
  ++(0,-1.2em) 
}
\def\FTroot{tmp.west}


\renewcommand{\maketitle}{
  \hrule
  \vspace*{3mm}
  \noindent \@date\\

  {\centering
    \vspace*{4mm}
    
    {\huge\@title}
    
    \vspace*{4mm}
    
    \@author
    
    \vspace*{4mm}
  }
  
  \hrule
  
  \vspace*{8mm}
}
