%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Mod�le LaTeX pour le m�moire de th�se de l'ETS
%% Bas� sur la classe de base book.cls, g�n�ralement positionn� 
%% dans un syst�me linux �
%% /usr/share/texmf/tex/latex/base/book.cls
%%
%% Modifications par Paulo Cavalin (cavalin@livia.etsmtl.ca)
%% [27 aout 2010]
%% Mises � jour du gabarit pour qu'il soit disponibilis� officielement par le d�canat
%% Utilisation du package geometry pour d�finir les marges
%% corrections relatives au guide dat� du 27-08-2010
%%
%% Corrections apport�es par C�cile Le Cocq (cecile.lecocq@etsmtl.ca)
%%
%% [17 mars 2008]
%% corrections relatives au nouveau guide de r�daction dat� du 12 novembre 2007
%%
%% Commentaires (et modifications?) par Luis Da Costa (costa@livia.etsmtl.ca)
%%
%% [14 Juillet 2006]  
%% Il faut laisser une ligne en blanc AVANT et APRES une citation de plus de 3 lignes: 
%% 
%% Zinedine Zidane a remarque 
%% [LIGNE EN BLANC]
%% \begin{quote} 
%%      parler de ma mere et de ma soeur merite bien un coup de boule. 
%% \end{quote} 
%% [LIGNE EN BLANC]
%%  
%% [14 Juillet 2006]  
%% Dans la table des matieres il doit y avoir une indentation. 
%% J'ai donc comment� ce que Seb avait implement� (chercher LUIS dans ce document
%% pour voir).  
%% 
%% Version 0.4 
%% Date : 2005/08/04
%%
%% Modifications par S. Piccand (sebastien.piccand@livia.etsmtl.ca)
%%
%% thETS4 est bas� sur thETS3
%% Quelques corrections au niveau de la table des mati�res
%%  - la division en section d'un chapitre est s�par�e par une ligne de l'intitul� du chapitre
%%  - les annexes sont correctement g�r�es
%%  - la bibliographie est corrig�e en utilisant le package natbib.sty et le style ETS.bst
%%  - ajout de l'option memoire. Par defaut il s'agit d'une th�se
%%  - correction des figures, sous figures, tables
%%  - correction des footnotes, utiliser \footnote{} comme d'habitude
%%  - correction de l'environnement "enumerate"
%%  - correction des citations utiliser \quote{} comme d'habitude
%%
%% Macros suppl�mentaires pour ajouter plus facilement des figures/tableaux et y faire r�f�rence
%% 
%% Non corrig� de la version 0.3 :
%%  * Dans les diff�rentes listes (figures, tables, etc.) il n'y a pas assez d'espace entre la fin
%%     du titre et les num�ros. Une solution consiste � utiliser des noms de figure courts.
%%  * Les titres des sections/chapitre/soussections/etc doivent �tre courts pour ne pas passer �
%%     la ligne dans la table des mati�res.
%%  * Les citations ne sont pas encore bonnes.
%%
%%
%% Version 0.3
%% Date : 2004/12/17
%% 
%% Modifications par G. Tremblay (guillaume.tremblay@livia.etsmtl.ca)
%% 
%% thETS3 est bas� sur thETS2 
%% Quelques corrections apport�es par rapport � la version 0.2: 
%% 
%% Utilisation de algorithme2e.sty sans probl�mes de compatibilit�. Correction faite par F. Grandidier
%% et appliqu�e par G. Tremblay
%% 
%% Les citations de plus de 3 lignes sont � interligne simple tel qu'exig� par le D�canat (utilisez begin{quoteETS})
%%
%% Les footnotes sont remplac�es par de footnoteETS pour ne pas avoir d'indentation de paragraphe
%%
%%
%% Version 0.2 
%% Date: 2003/05/06
%% 
%% Par F. Grandidier (gfrede@livia.etsmtl.ca)
%%
%% Ajout ver 0.2: alignement du titre du chapitre dans la table
%%                des mati�res lorsqu'il tient sur plusieurs
%%                lignes
%% 
%% 
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\filedate{2003/01/24}

\NeedsTeXFormat{LaTeX2e}[1994/06/01] %% Mis par d�faut
\ProvidesClass{thETS}[\filedate\space Standard ETS class]

%% M�mes options possibles que celle de la classe book.cls
%% Cependant tous ne va peut �tre pas marcher comme dans book...
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} 

\newcommand{\TypeDoc}{these}
\DeclareOption{memoire}{%
  \renewcommand{\TypeDoc}{memoire}
}
\DeclareOption{thesepararticles}{%
  \renewcommand{\TypeDoc}{thesepararticles}
}

\newcommand{\TypeLic}{reserved}
\DeclareOption{creativecommons}{
   \renewcommand{\TypeLic}{creativecommons}
}


\ProcessOptions

\LoadClass{book} %% Chargement de la classe book
\RequirePackage{mathptmx} %% Police Times
\RequirePackage[frenchb]{babel} %% Francisation du document
%\RequirePackage[latin1]{inputenc} %% Prise en compte de la frappe de caract�res
% accentu�s 
\usepackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc} %% Codage standard des fontes LaTeX pour le
% fran�ais 
\RequirePackage{calc} %% permet de r�aliser des additions et soustractions de
% valeurs lors d'affectation de variables
\RequirePackage{setspace}
\RequirePackage{ifthen} %% Permet de r�aliser des tests sur des variables
\RequirePackage{amsthm} % clc
\RequirePackage{longtable}
\RequirePackage{float}
\RequirePackage{listings} %% Code listings (extraits de code)
\RequirePackage[paper=letterpaper,tmargin=1.5in,lmargin=1.5in,rmargin=0.75in,bmargin=0.75in,body={6.25in,8.75in}]{geometry}
\RequirePackage[labelfont={bf},margin=10pt,justification=centering]{caption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D�finition de commandes pour la pr�sentation du jury
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\PrefDirect}{M.}
\newcommand{\NomDirect}{Nom du directeur de recherche}
\ifthenelse{\equal{\TypeDoc}{these}}{
  \newcommand{\TxtDirect}{directeur de th�se}
}{
  \newcommand{\TxtDirect}{directeur de m�moire}
}
\newcommand{\AffilDirect}{Affiliation du directeur}
\newcommand{\PrefCoDirect}{M.}
\newcommand{\NomCoDirect}{Nom du codirecteur}
\newcommand{\TxtCoDirect}{codirecteur}
\newcommand{\AffilCoDirect}{Affiliation du codirecteur}
\newcommand{\PrefPresid}{M.}
\newcommand{\NomPresid}{Nom du pr�sident du jury}
\newcommand{\TxtPresid}{pr�sident du jury}
\newcommand{\AffilPresid}{Affiliation du pr�sident du jury}
\newcommand{\PrefExamExt}{M.}
\newcommand{\NomExamExt}{Nom de l'examinateur externe}
%\newcommand{\TxtExamExt}{membre du jury}
\newcommand{\TxtExamExt}{examinateur externe}
\newcommand{\PlusTxtExamExt}{Blabla}
\newcommand{\AffilExamExt}{Affiliation de l'examinateur externe}
\newcommand{\PrefJury}{M.}
\newcommand{\NomJury}{Nom d'un membre du jury}
\newcommand{\TxtJury}{membre du jury}
%\newcommand{\TxtJury}{examinateur}
%\newcommand{\TxtJury}{membre du jury}
%\newcommand{\TxtJury}{}    % modifi� pour mon membre du jury Patrick Maupin
\newcommand{\PlusTxtJury}{Blabla}
\newcommand{\AffilJury}{Affiliation du membre du jury}
\newcommand{\PrefJuryB}{M.}
\newcommand{\NomJuryB}{Nom d'un membre du jury}
\newcommand{\TxtJuryB}{examinateur invit�}
\newcommand{\PlusTxtJuryB}{Blabla}
\newcommand{\AffilJuryB}{Affiliation du membre du jury}

%% Directeur de th�se
\newcommand{\directeur}[3]{%
  \renewcommand{\PrefDirect}{#1}%
  \ifthenelse{\equal{#1}{Mme}}{% Permet de modifier pour le f�minin
    \ifthenelse{\equal{\TypeDoc}{these}}{
      \renewcommand{\TxtDirect}{directrice de th�se}
    }{%
      \renewcommand{\TxtDirect}{directrice de m�moire}}
    
  }{
  }%
  \renewcommand{\NomDirect}{#2}%
  \renewcommand{\AffilDirect}{#3}%
  }%
%% Co-directeur de th�se
\newcommand{\codirecteur}[3]{%
  \renewcommand{\PrefCoDirect}{#1}%
  \ifthenelse{\equal{#1}{Mme}}{%
    \renewcommand{\TxtCoDirect}{codirectrice}}{}%
  \renewcommand{\NomCoDirect}{#2}%
  \renewcommand{\AffilCoDirect}{#3}%
  }%
%% Pr�sident du jury
\newcommand{\president}[3]{%
  \renewcommand{\PrefPresid}{#1}%
  \ifthenelse{\equal{#1}{Mme}}{%
    \renewcommand{\TxtPresid}{pr�sidente du jury}}{}%
  \renewcommand{\NomPresid}{#2}%
  \renewcommand{\AffilPresid}{#3}%
  }%
%% Examinateur externe
\newcommand{\examinexterne}[4]{%
  \renewcommand{\PrefExamExt}{#1}%
  \ifthenelse{\equal{#1}{Mme}}{%
    \renewcommand{\TxtExamExt}{examinatrice externe}}{}%
  \renewcommand{\NomExamExt}{#2}%
  \renewcommand{\AffilExamExt}{#3}%
  \renewcommand{\PlusTxtExamExt}{#4}%
  }%
%% Membre du jury
\newcommand{\jury}[4]{%
  \renewcommand{\PrefJury}{#1}%
  \ifthenelse{\equal{#1}{Mme}}{%
    \renewcommand{\TxtJury}{membre du jury}}{}%
  \renewcommand{\NomJury}{#2}%
  \renewcommand{\AffilJury}{#3}%
  \renewcommand{\PlusTxtJury}{#4}%
  }%
%% Membre du jury
\newcommand{\juryB}[4]{%
  \renewcommand{\PrefJuryB}{#1}%
  \ifthenelse{\equal{#1}{Mme}}{%
    \renewcommand{\TxtJuryB}{examinatrice invit�e}}{}%
  \renewcommand{\NomJuryB}{#2}%
  \renewcommand{\AffilJuryB}{#3}%
  \renewcommand{\PlusTxtJuryB}{#4}%
  }%
%% Bon l�l�, si il y a d'autres membres �a devient le bordel. 2 possibilit� : 
%% - rendre le code dynamique, mais �a � l'air vachement compliqu�
%% - cr�er des variables examext2, juryB, jury3,... (plus facile)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pour le copyright, c'est Pr�nom Nom
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\authorcopyright#1{\gdef\@authorcopyright{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variable associ�e aux dates de
%% soutenance et de d�p�t
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\datesoutenance#1{\gdef\@datesoutenance{#1}}
\def\datedepot#1{\gdef\@datedepot{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variable pour la mise en page des chapitres dans
%% la table des mati�res
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\largChap}
\newlength{\largNum}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Marges horizontales du document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newlength{\margegauche}
%\setlength{\margegauche}{108.405pt}%{1.5in}
%\newlength{\margedroite}
%\setlength{\margedroite}{54.2025pt}%{72.27pt}%{1in}%{0.75in}
%\setlength{\oddsidemargin}{\margegauche - (72.27pt + \hoffset)}%{\margegauche - (1in + \hoffset)}
%%\setlength{\evensidemargin}{\margedroite - (72.27pt + \hoffset)}%{\margedroite - (1in + \hoffset)} % Pour une mise en page recto-verso
%\setlength{\textwidth}{\paperwidth - \margegauche - \margedroite}
%%\setlength{\marginparsep}{0pt}
%%\setlength{\marginparwidth}{\margedroite}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Marges verticales du document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newlength{\margehaut}
%\setlength{\margehaut}{108.405pt}%{1.5in}
%\newlength{\margebas}
%\setlength{\margebas}{54.2025pt}%{0.75in}
%\setlength{\topmargin}{-15.363pt}%{-5.4mm} % 1 in - 20 mm
%\setlength{\headheight}{12pt}
%\setlength{\headsep}{\margehaut - \headheight - \topmargin - 72.27pt - \voffset}%{\margehaut - \headheight - \topmargin - 1in - \voffset}
%\setlength{\textheight}{\paperheight - \margehaut - \margebas}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Marges autour des objets flottants : figures et tableaux
%% Ce n'est pas au point, il y aurait des ajustements � faire.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\abovecaptionskip{1em}
\setlength\belowcaptionskip{1em}
%\setlength\floatsep{1em}
\setlength\textfloatsep{12pt}
%\setlength\intextsep{1em}

%%%%%%%%%%%%%%%%%%%
%% Marge la table des mati�res et les diff�rentes listes
%%%%%%%%%%%%%%%%%%%
\newlength{\tocRightMargin} % Marge droite
\setlength{\tocRightMargin}{2cm}
\newlength{\tocLeftMarginSecondLine}
\setlength{\tocLeftMarginSecondLine}{6.1em} % Marge gauche quand on va � la ligne pour les sections et sous sections
\newlength{\tocLeftMarginSecondLineChapter}
\setlength{\tocLeftMarginSecondLineChapter}{6.1em} % Marge gauche quand on va � la ligne pour les chapitres et annexes
\newlength{\tocLeftMarginSecondLineFigure}
%\setlength{\tocLeftMarginSecondLineFigure}{5.2em} % Marge gauche quand on va � la ligne pour les figures
\setlength{\tocLeftMarginSecondLineFigure}{6.5em} % Marge gauche quand on va � la ligne pour les figures
\newlength{\tocLeftMarginSecondLineTable}
%\setlength{\tocLeftMarginSecondLineTable}{5.9em} % Marge gauche quand on va � la ligne pour les tableaux
\setlength{\tocLeftMarginSecondLineTable}{7.1em} % Marge gauche quand on va � la ligne pour les tableaux, MODIFIEE car besoin de decaler titres des tableaux vers la droite !!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fraction maxi des objets flottants 
%% en haut et bas de page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\floatpagefraction}{.99}
\renewcommand{\textfraction}{.01}
\renewcommand{\topfraction}{.99}
\renewcommand{\bottomfraction}{.99}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Interligne du document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\mystretch{1.5}
\def\baselinestretch{\mystretch}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Espace entre 2 paragraphes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\parskip}{12pt} % 12pt 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pas d'indentation des paragraphes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\parindent}{0pt}
%% La commande pr�c�dente avec babel french supprime l'indentation des listes
%% La commande suivante permet de conserver l'indentation des listes
%% Obtenu de la documentation du package Babel
%\FrenchItemizeSpacingfalse 
%\frenchbsetup{CompactItemize=false}
\ifx\frenchbsetup\undefined
\FrenchItemizeSpacingfalse
\else
\frenchbsetup{CompactItemize=false}
\fi 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pour �viter les veuves et orphelins
%% (lignes seules en d�but ou fin de pages)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\widowpenalty=10000
\clubpenalty=10000
\raggedbottom

%%% footnote 
%
% Pour enlever l'indentation des footnotes (LUIS)
%
\newlength{\NameOfNewDefinedLength}

\newcommand{\footnoteETS}[1]%
{\footnote{\setlength{\NameOfNewDefinedLength}{\textwidth}
                 \advance\leftskip -2.7mm  %%
                 \addtolength{\NameOfNewDefinedLength}{-2em+2.mm}
                 \hskip -1.mm
                 \parbox[t]{\NameOfNewDefinedLength}{\raggedright #1}}}

% \newcommand{\footnoteETS}{\footnote} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page titre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\lediplome}{
  DU\\
  DOCTORAT EN G�NIE\\
  Ph.D.
}
\newcommand{\diplome}[1]{
  \renewcommand{\lediplome}{#1}
}  

\renewcommand{\maketitle}{\begin{titlepage}
 \renewcommand{\baselinestretch}{1}\small\normalsize % Interligne simple
    \let\footnotesize\small%
    \let\footnoterule\relax%
    \let \footnote \thanks%
   \begin{center}
      �COLE DE TECHNOLOGIE SUP�RIEURE\\
      UNIVERSIT� DU QU�BEC
      \vfill
      \ifthenelse{\equal{\TypeDoc}{these}}{
        TH�SE PR�SENT�E
      }
      {\ifthenelse{\equal{\TypeDoc}{thesepararticles}}{
        TH�SE PAR ARTICLES PR�SENT�E
      }{
        M�MOIRE PR�SENT�
      }
      } �\\
      L'�COLE DE TECHNOLOGIE SUP�RIEURE
      \vfill
      COMME EXIGENCE PARTIELLE\\
      � L'OBTENTION %DE LA\\
%      MA�TRISE EN G�NIE �LECTRIQUE\\
%      M.Ing.
      \lediplome
      \vfill
      PAR\\
	\@author
      %\MakeUppercase{\@author}%
      \vfill
      \MakeUppercase{\@title}%
      \vfill
      MONTR�AL, LE \MakeUppercase{\@datedepot}%
      
      \vspace{1em}%{.7cm}
      {\footnotesize 

      \ifthenelse{\equal{\TypeLic}{reserved}}{ 
          \copyright~Tous droits r�serv�s, \@authorcopyright, \number\year
      }{
         \includegraphics{logocc.png}, \@authorcopyright, \number\year
      }}
   \end{center}
   \end{titlepage}
   \clearpage

   %Verso 
  \newpage     
  ~\\
  \vspace{15cm}
   
   \ifthenelse{\equal{\TypeLic}{reserved}}{%
   \fbox{\parbox{6.4in}{
   \copyright~Tous droits r�serv�s
    \newpage
    Cette licence signifie qu'il est interdit de reproduire, d'enregistrer ou de diffuser en tout ou en partie, 
    le pr�sent document.  Le lecteur qui d�sire imprimer ou conserver sur un autre media une partie importante de 
    ce document, doit obligatoirement en demander l'autorisation � l'auteur.   
    }}
   }{%
   \fbox{\parbox{6.4in}{
   \includegraphics{logocc.png}
   \newline
   Cette licence Creative Commons signifie qu'il est permis de diffuser, d'imprimer ou de sauvegarder sur un autre support 
   une partie ou la totalit� de cette oeuvre � condition de mentionner l'auteur, que ces utilisations soient faites � des 
   fins non commerciales et que le contenu de l'oeuvre n'ait pas �t� modifi�.   
   }}
   }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page de pr�sentation du jury
% LUIS A ELIMINE L'ESPACE ENTRE LES NOMS ET LES AFFILIATIONS (D�canat...) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\presentjury{\begin{jurypage}%
  \let\footnotesize\small%
  \let\footnoterule\relax%
  \begin{center}%
    \renewcommand{\baselinestretch}{2}\small\normalsize
    \textbf{PR�SENTATION DU JURY}\\
    \ifthenelse{\equal{\TypeDoc}{memoire}}{
      CE M�MORIE A �T� �VALU�E
    }{CETTE TH�SE A �T� �VALU�
    }\\
    PAR UN JURY COMPOS� DE\\
    \vspace{6em}%
  \end{center}
  \begin{flushleft}
    \renewcommand{\baselinestretch}{1}\small\normalsize
    % Directeur de m�moire
    \PrefDirect~\NomDirect,~\TxtDirect\\
    % \vspace{3pt} % LUIS 
    \AffilDirect\par
    \vspace{1em}
    % Codirecteur optionnel
    \ifthenelse{\equal{\NomCoDirect}{Nom du co-directeur}}{}{%
      \PrefCoDirect~\NomCoDirect,~\TxtCoDirect\\%
      \vspace{3pt}
      \AffilCoDirect\par%
      \vspace{1em}
    }%
    % Pr�sident du jury
    \PrefPresid~\NomPresid,~\TxtPresid\\%
    % \vspace{3pt}
    \AffilPresid\par%
    \vspace{1em}%
    
 % Jury
    \ifthenelse{\equal{\NomExamExt}{Nom d'un membre du jury}}{}{%
	\PrefJury~\NomJury,~\TxtJury\\
%      \PrefJury~\NomJury\ifthenelse{\equal{\PlusTxtJury}{}}{,~}{,~\PlusTxtJury}%
%     \TxtJury\\%
      % \vspace{3pt}
      \AffilJury\par%
      \vspace{1em}
    }%

    % Examinateur externe
    \ifthenelse{\equal{\NomExamExt}{Nom de l'examinateur externe}}{}{%
      \PrefExamExt~\NomExamExt,~\TxtExamExt\\
%	\PrefExamExt~\NomExamExt\ifthenelse{\equal{\PlusTxtExamExt}{}}{,~}{,~\PlusTxtExamExt,~}%
   %   \TxtExamExt\\%
      % \vspace{3pt}
      \AffilExamExt\par%
      \vspace{1em}
    }%
    
   
    
    % JuryB optionnel
    \ifthenelse{\equal{\NomJuryB}{Nom d'un membre du jury}}{}{%
      \PrefJuryB~\NomJuryB\ifthenelse{\equal{\PlusTxtJuryB}{}}{,~}{,~\PlusTxtJuryB}%
      \TxtJuryB\\%
      % \vspace{3pt}
      \AffilJuryB\par%
      \vspace{1em}
    }%
      
  \end{flushleft}
  \begin{center}%
    \vspace{3em}%
    \renewcommand{\baselinestretch}{2}\small\normalsize%
    \ifthenelse{\equal{\TypeDoc}{these}}{
      ELLE
    }{
      IL
    } A FAIT L'OBJET D'UNE SOUTENANCE DEVANT JURY ET PUBLIC\\
    LE \MakeUppercase{\@datesoutenance}\\
    � L'�COLE DE TECHNOLOGIE SUP�RIEURE
  \end{center}\par%
  \vfil\null%
  \end{jurypage}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Profondeur de la num�rotation des divisions des chapitres
%% Valeur de 1(\section) � 5(\subparagraph)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{5}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Changement dans la table des mati�res 
%% des entr�es associ�es aux chapitres
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@chapter[#1]#2{
  \ifnum \c@secnumdepth >\m@ne%
    \if@mainmatter%
      \refstepcounter{chapter}%
      \typeout{\@chapapp\space\thechapter}%
      \addcontentsline{toc}{chapter}{\protect{\MakeUppercase{\@chapapp\ \thechapter\hskip 1em #1}}}%
    \else%
      \addcontentsline{toc}{chapter}{#1}%
    \fi%
  \else%
    \addcontentsline{toc}{chapter}{#1}%
  \fi%
  \chaptermark{#1}%
%  \addtocontents{toc}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}%
  \@afterheading%
  }%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Modification des chapitres num�rot�s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\@makechapterhead}[1]{{
        \normalfont\bfseries%
        \begin{center}
        \etchapterheadstyle{\@chapapp{ \thechapter}} % CHAPTER 1
        \vskip 3\p@%
        \etchapterheadstyle{#1} % TITLE OF CHAPTER
        \end{center}
        \vskip 5\p@%
        \thispagestyle{empty}%
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Modification des chapitres sans num�ro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\@makeschapterhead}[1]{{
    \thispagestyle{empty}
        \normalfont\bfseries%
        \begin{center}
        \etchapterheadstyle{#1} % TITLE OF CHAPTER
        \end{center}
}}

\newcommand{\etchapterheadstyle}[1]{\MakeUppercase{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D�finition des espacements avant et apr�s les diff�rentes
%% divisions de chapitre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\section{\@startsection{section}{1}{\z@}%
                                   {-0.25ex \@plus -1ex \@minus -.2ex}%
                                   {0.5ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-0.25ex\@plus -1ex \@minus -.2ex}%
                                     {0.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-0.25ex\@plus -1ex \@minus -.2ex}%
                                     {0.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-0.25ex \@plus -1ex \@minus -.2ex}%
                                    {0.5ex \@plus .2ex}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {0.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% R�d�finition de l'environnement de la page de titre 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{titlepage}{%
  \if@twocolumn
     \@restonecoltrue\onecolumn%
  \else
     \@restonecolfalse\newpage
  \fi
  \thispagestyle{empty}%
  \setcounter{page}\@ne%
  }%
{\if@restonecol\twocolumn \else \newpage \fi%
  \if@twoside\else%
  \setcounter{page}\@ne%
  \fi
  \thispagestyle{empty}%
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D�finition de l'environnement de la pr�sentation du jury
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{jurypage}{%
  \if@twocolumn
     \@restonecoltrue\onecolumn%
  \else
     \@restonecolfalse\newpage
  \fi
  \thispagestyle{empty}%
  \setcounter{page}\@ne%
  }%
{\if@restonecol\twocolumn \else \newpage \fi%
  \if@twoside\else%
  \setcounter{page}\@ne%
  \fi
  \thispagestyle{empty}%
  \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sommaire
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newsavebox{\MotCles} %pour enregistrer les mot-cl�s
\newenvironment{sommaire}[1]{%
  \sbox\MotCles{#1}
  \if@twocolumn
     \@restonecoltrue\onecolumn%
  \else
     \@restonecolfalse\newpage
  \fi
  \cleardoublepage
  \thispagestyle{empty}% Pas de num�rotation sur cette page
  %\setcounter{page}{1} % Premi�re page num�rot�e du document
  %\addcontentsline{toc}{chapter}{R�SUM�} % Ajout dans la table des mati�res
  \renewcommand{\baselinestretch}{1}\small\normalsize % Interligne simple
  \begin{center}
    \normalfont%
    \MakeUppercase{\bfseries\@title}%
    \vskip 6\p@%
    \@author%
    \vskip 6\p@%
    \MakeUppercase{\textbf{R�SUM�}}%
  \end{center}
  
}
{
  {\bf Mot-cl�s:} \usebox{\MotCles}

  \if@restonecol\twocolumn \else \newpage \fi%
  \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newsavebox{\KeyWords} %pour enregistrer les keywords
\newenvironment{abstract}[2]{%
  \sbox\KeyWords{#2}
  \if@twocolumn
     \@restonecoltrue\onecolumn%
  \else
     \@restonecolfalse\newpage
  \fi
  \cleardoublepage
  \thispagestyle{empty}% Pas de num�rotation sur cette page
  %\addcontentsline{toc}{chapter}{ABSTRACT}
  \renewcommand{\baselinestretch}{1}\small\normalsize % Interligne simple
  \begin{center}
    \normalfont%
    \MakeUppercase{\bfseries#1}%
    \vskip 6\p@%
    \@author%
    \vskip 6\p@%
    \MakeUppercase{\textbf{ABSTRACT}}%
  \end{center}
}
{
  {\bf Keywords:} \usebox{\KeyWords}

  \if@restonecol\twocolumn \else \newpage \fi%
  \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Avant-propos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{avantpropos}{%
  \chapter*{Avant-propos}
%  \addcontentsline{toc}{chapter}{AVANT-PROPOS} % Ajout dans la table des mati�res
%  \chapter*{Avant-propos et remerciements}
 % \addcontentsline{toc}{chapter}{AVANT-PROPOS ET REMERCIEMENTS} % Ajout dans la table des mati�res
    % Interligne double
%    \renewcommand{\baselinestretch}{2}\small\normalsize%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Introduction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{introduction}{%
  \chapter*{Introduction}
  \addcontentsline{toc}{chapter}{INTRODUCTION} % Ajout dans la table des mati�res
 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Conclusion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{conclusion}{%
  \chapter*{Conclusion}
  \addcontentsline{toc}{chapter}{CONCLUSION} % Ajout dans la table des mati�res
 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Remerciement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{remerciements}{%
  \chapter*{Remerciements}
 % \addcontentsline{toc}{chapter}{REMERCIEMENTS} % Ajout dans la table des mati�res
    % Interligne double
%    \renewcommand{\baselinestretch}{2}\small\normalsize%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Commande pour �crire ``Page'' 
%% dans les diff�rentes tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\tdmpage}[0]{\hspace{\fill}\mbox{Page}\vskip 1.0em\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table des mati�res
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  %\addcontentsline{toc}{chapter}{\MakeUppercase{\contentsname}} % Ajout dans la table des mati�res
  \tdmpage
  {
    % Espace avant les diff�rentes lignes de la table des mati�res
    \setlength{\parskip}{0pt}%
    % Interligne simple pour la table des mati�res
    \renewcommand{\baselinestretch}{1}\small\normalsize%
    \@starttoc{toc}
    }
}

%%% Modification de l'espace entre les points de la table des mati�res
\renewcommand{\@dotsep}{1} % (\@dotsep est une valeur)


% Les parties n'�tant pas utilis�es on s'en sert pour pouvoir ajouter annexe correctement dans la table des matieres
\renewcommand*\l@part[2]{%
  \settowidth{\largChap}{\MakeUppercase{\@chapapp\ \thechapter\hskip 1em}}
  \ifnum \c@tocdepth >\m@ne%
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@%
    \setlength\@tempdima{\largChap}%
    \begingroup
      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth%
      \parfillskip -\tocRightMargin%\@pnumwidth%
      \leavevmode %
      \advance\leftskip \tocLeftMarginSecondLineChapter%\@tempdima%
      \hskip -\leftskip%
      #1\nobreak\leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{}\mkern \@dotsep mu$}\hfil \nobreak\hb@xt@\@pnumwidth{\hss }\par%
      \penalty\@highpenalty%
    \endgroup
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Modif pour ne pas avoir le chapitre en gras 
%% dans la table des mati�res
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*\l@chapter[2]{%
  \settowidth{\largChap}{\MakeUppercase{\@chapapp\ \thechapter\hskip 1em}}
  \settowidth{\largNum}{\hss #2}
  \ifnum \c@tocdepth >\m@ne%
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@%
    \setlength\@tempdima{\largChap}%
    \begingroup
      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth%
      \parfillskip -\tocRightMargin%\@pnumwidth%
      \leavevmode %
      \advance\leftskip \tocLeftMarginSecondLine%\@tempdima%
      \hskip -\leftskip%
      #1\nobreak\leaders\hbox{$\m@th \hbox{.}\mkern \@dotsep mu$}\hfil \nobreak\hb@xt@%
      \largNum{\hss #2}\par%
      \penalty\@highpenalty%
    \endgroup
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table des mati�res
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\tableofcontents{%
  \chapter*{\contentsname}
  \tdmpage
    {
      % Espace avant les diff�rentes lignes de la table des mati�res
      \setlength{\parskip}{0pt}%
      % Interligne simple pour la table des mati�res
      \renewcommand{\baselinestretch}{1}\small\normalsize%
      \@starttoc{toc}
    }
}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne%
    \addpenalty{-\@highpenalty}%
    \vskip 1em \@plus\p@%
%    \setlength\@tempdima{1.5em}%
    \setlength\@tempdima{6.1em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth%
      \parfillskip -\@pnumwidth%
      \leavevmode %
      \advance\leftskip\@tempdima%
      \hskip -\leftskip%
      #1\nobreak
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par%
      \penalty\@highpenalty%
    \endgroup
  \fi
%    \vskip -1em
  }
\renewcommand*\l@section{\@dottedtocline{1}{0em}{3.5em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{3.5em}{3.5em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{7em}{3.5em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{2.5em}{3.5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{2.5em}{3.5em}}
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Pour aligner toutes les entr�es 
%%% de la table des mati�res
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%% IMPLEMENTE PAR SEB, MIS ENTRE COMMENTAIRES PAR LUIS (CAR LE NOUVEAU FORMAT EXIGE 
%%%%%%% QUE LES "SECTION" SOIENT INDENTES PAR RAPPORT AUX "CHAPTER", LES "SUBSECTION" PAR RAPPORT AU "SECTION", ETC. 
%%%%%%% *****************   DEBUT COMMENTAIRES ***************************** 
%% STEPHANE - les section sont align� sur les chapitres
%\renewcommand*\l@section[2]{%
%  \settowidth{\largNum}{\hss #2}
%  \ifnum \c@tocdepth >\z@
%    \addpenalty{-\@highpenalty}%
%%    \hskip 2.5 em
%    \setlength\@tempdima{3.5em}%
%    \begingroup
%      \pretolerance=10000
%      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth
%      \parfillskip -\tocRightMargin%\@pnumwidth
%      \leavevmode %
%      \advance\leftskip \tocLeftMarginSecondLine%\@tempdima
%      \hskip -\leftskip
%      #1\nobreak\leaders\hbox{$\m@th \hbox{.}\mkern \@dotsep mu$}\hfil \nobreak\hb@xt@%\@pnumwidth%
%      \largNum{\hss #2}\par%
%    \endgroup
%  \fi}

%\renewcommand*\l@subsection[2]{%
%  \settowidth{\largNum}{\hss #2}
%  \ifnum \c@tocdepth >\z@
%    \addpenalty{-\@highpenalty}%
%    \hskip 2.5 em
%    \setlength\@tempdima{3.5em}%
%   \begingroup
%      \pretolerance=10000
%      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth
%     \parfillskip -\tocRightMargin%\@pnumwidth
%      \leavevmode %
%      \advance\leftskip \tocLeftMarginSecondLine%\@tempdima
%      \hskip -\leftskip
%      #1\nobreak\leaders\hbox{$\m@th \hbox{.}\mkern \@dotsep mu$}\hfil \nobreak\hb@xt@%\@pnumwidth%
%      \largNum{\hss #2}\par%
%    \endgroup
%  \fi}

%\renewcommand*\l@subsubsection[2]{%
%  \settowidth{\largNum}{\hss #2}
%  \ifnum \c@tocdepth >\z@
%    \addpenalty{-\@highpenalty}%
%    \hskip 2.5 em
%    \setlength\@tempdima{3.5em}%
%    \begingroup
%      \pretolerance=10000
%      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth
%      \parfillskip -\tocRightMargin%\@pnumwidth
%      \leavevmode %
%      \advance\leftskip \tocLeftMarginSecondLine%\@tempdima
%      \hskip -\leftskip
%      #1\nobreak\leaders\hbox{$\m@th \hbox{.}\mkern \@dotsep mu$}\hfil \nobreak\hb@xt@%\@pnumwidth%
%      \largNum{\hss #2}\par%
%    \endgroup
%  \fi}
%%%%%%% *****************   FIN COMMENTAIRES ***************************** 
%%%%%%% *****************         LUIS       ***************************** 

%\renewcommand*\l@paragraph[2]{%
%  \settowidth{\largNum}{\hss #2}
%  \ifnum \c@tocdepth >\z@
%    \addpenalty{-\@highpenalty}%
%    \hskip 2.5 em
%    \setlength\@tempdima{3.5em}%
%    \begingroup
%      \pretolerance=10000
%      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth
%      \parfillskip -\tocRightMargin%\@pnumwidth
%      \leavevmode %
%      \advance\leftskip \tocLeftMarginSecondLine%\@tempdima
%      \hskip -\leftskip
%      #1\nobreak\leaders\hbox{$\m@th \hbox{.}\mkern \@dotsep mu$}\hfil \nobreak\hb@xt@%\@pnumwidth%
%      \largNum{\hss #2}\par%
%    \endgroup
%  \fi}
%
%\renewcommand*\l@subparagraph[2]{%
%  \settowidth{\largNum}{\hss #2}
%  \ifnum \c@tocdepth >\z@
%    \addpenalty{-\@highpenalty}%
%    \hskip 2.5 em
%    \setlength\@tempdima{3.5em}%
%    \begingroup
%      \pretolerance=10000
%      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth
%      \parfillskip -\tocRightMargin%\@pnumwidth
%      \leavevmode %
%      \advance\leftskip \tocLeftMarginSecondLine%\@tempdima
%      \hskip -\leftskip
%      #1\nobreak\leaders\hbox{$\m@th \hbox{.}\mkern \@dotsep mu$}\hfil \nobreak\hb@xt@%\@pnumwidth%
%      \largNum{\hss #2}\par%
%    \endgroup
%  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Profondeur des entr�es dans la table 
%% des mati�res: 3=\subsubsection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pour rendre ind�pendante la num�rotation des figures et tables
%% de la num�rotation du chapitre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\def\@removefromreset#1#2{{%
%  \expandafter\let\csname c@#1\endcsname\@removefromreset
%  \def\@elt##1{%
%    \expandafter\ifx\csname c@##1\endcsname\@removefromreset
%    \else
%      \noexpand\@elt{##1}%
%    \fi}%
%  \expandafter\xdef\csname cl@#2\endcsname{%
%    \csname cl@#2\endcsname}}}

%\makeatletter
%\@removefromreset{figure}{chapter}
%\@removefromreset{table}{chapter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Liste des figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\listoffigures{%
    \chapter*{\listfigurename}
    %\addcontentsline{toc}{chapter}{\MakeUppercase{\listfigurename}} % Ajout dans la table des mati�res
    \tdmpage
    {
      \setlength{\parskip}{0pt}%
      \renewcommand{\baselinestretch}{1}\small\normalsize%
      \@starttoc{lof}%
    }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Num�rotation des figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand \thefigure
%     {\@arabic\c@figure}
\renewcommand*\l@figure[2]{%
  \settowidth{\largNum}{\hss #2}
  \ifnum \c@tocdepth >\m@ne%
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@%
    \setlength\@tempdima{3.4em}%
        \noindent%
    \begingroup
      \pretolerance=10000
      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth%
      \parfillskip -\tocRightMargin%\@pnumwidth%
     \leavevmode \normalsize%
     \advance\leftskip \tocLeftMarginSecondLineFigure%
      \hskip -\leftskip%
      {\figurename\mbox{\hspace{4pt}}#1}\nobreak%
       \leaders\hbox{$\m@th%
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep%
        mu$} \hfil\nobreak\hb@xt@%
                    \largNum{\hss #2}\par%
      \penalty\@highpenalty%
    \endgroup
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Liste des tableaux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\listoftables{%
  \chapter*{\listtablename}
  %\addcontentsline{toc}{chapter}{\MakeUppercase{\listtablename}} % Ajout dans la table des mati�res
  \tdmpage
  {
    \setlength{\parskip}{0pt}%
    \renewcommand{\baselinestretch}{1}\small\normalsize%
    \@starttoc{lot}%
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Num�rotation des tableaux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\thetable}
%             {\@arabic\c@table}
%\renewcommand{\thetable}{\Roman{table}}

\renewcommand*\l@table[2]{%
  \settowidth{\largNum}{\hss #2}
  \ifnum \c@tocdepth >\m@ne%
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@%
    \setlength\@tempdima{3.4em}%ici pour changer l'espace entre le numero et le titre du tableau !! (d�faut 2.2em)
        \noindent%
    \begingroup
      \pretolerance=10000
      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth %
      \parfillskip -\tocRightMargin%\@pnumwidth%
      \leavevmode \normalsize%
     \advance\leftskip \tocLeftMarginSecondLineTable %5.2em%8.4em%
      \hskip -\leftskip%
      {\tablename\mbox{\hspace{4pt}}#1}\nobreak%
       \leaders\hbox{$\m@th%
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep%
        mu$} \hfil\nobreak\hb@xt@%\@pnumwidth
                    \largNum{\hss #2}\par%
      \penalty\@highpenalty%
    \endgroup
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Liste des extraits de code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\lstlistoflistings{%
    \chapter*{\lstlistlistingname}%
    \tdmpage
    {
      \setlength{\parskip}{0pt}%
      \renewcommand{\baselinestretch}{1}\small\normalsize%
      \@starttoc{lol}%
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Num�rotation des extraits de code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*\l@lstlisting[2]{%
  \settowidth{\largNum}{\hss #2}
  \ifnum \c@tocdepth >\m@ne%
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@%
    \setlength\@tempdima{3.4em}%
        \noindent%
    \begingroup
      \pretolerance=10000
      \parindent \z@ \rightskip \tocRightMargin%\@pnumwidth%
      \parfillskip -\tocRightMargin%\@pnumwidth%
     \leavevmode \normalsize%
     \advance\leftskip \tocLeftMarginSecondLineFigure%
      \hskip -\leftskip%
      {\lstlistingname\mbox{\hspace{4pt}}#1}\nobreak%
       \leaders\hbox{$\m@th%
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep%
        mu$} \hfil\nobreak\hb@xt@%
                    \largNum{\hss #2}\par%
      \penalty\@highpenalty%
    \endgroup
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Liste des symboles bas� sur l'environnement ``description''
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\descril}
\setlength{\descril}{2cm}
\newenvironment{listofsymbols}[1][\descril]{%
  \cleardoublepage
  \chapter*{Liste des symboles et unit�s de mesure}
  %\addcontentsline{toc}{chapter}{\MakeUppercase{Liste des abr�viations et sigles}} % Ajout dans la table des mati�res
  \begin{list}{\mbox{}}{%
      \let\makelabel\losymblabel%
      \leftmargin #1%
      \labelwidth \leftmargin%
      \labelsep    1mm}}%
  {\end{list}}
\newcommand*\losymblabel[1]{\hspace\labelsep
  \normalfont\mbox{ #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Liste des symboles bas� sur l'environnement ``description''
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{listofabbr}[1][\descril]{%
   \cleardoublepage
  \chapter*{Liste des abr�viations, sigles et acronymes}
  %\addcontentsline{toc}{chapter}{\MakeUppercase{Liste des abr�viations et sigles}} % Ajout dans la table des mati�res
  \begin{list}{\mbox{}}{%
      \let\makelabel\losymblabel%
      \leftmargin #1%
      \labelwidth \leftmargin%
      \labelsep    1mm}}%
  {\end{list}}
\renewcommand*\losymblabel[1]{\hspace\labelsep
  \normalfont\mbox{ #1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mise en forme des l�gendes pour les figures et tableaux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\largetiqfig}
\setlength{\largetiqfig}{2.2cm}
\newlength{\larglegendfig}
\setlength{\larglegendfig}{\textwidth-\largetiqfig}

%%%%%
% Petit bout qui fucke les algorithmes...
%%%%
%\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname ext@#1\endcsname}{#1}{%
%   \protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
%   \begingroup\@parboxrestore\normalsize%
%     \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}{#1}\par%
%     \endgroup}
%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Remplac� par ce petit bout (merci � Fred)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname ext@#1\endcsname}{#1}
{%
    \protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
  \begingroup\@parboxrestore\normalsize%
  \pretolerance=10000
  \ifx\figurestring#1
     \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}{#1}\par%
  \else
     \ifx\tablestring#1
        \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}{#1}\par%
        \footnotesize \centering
     \else
        \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par%
        \footnotesize \centering
     \fi
  \fi
  \pretolerance=100
  \endgroup}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength{\tempabovecaptionskip}   %% Pour enlever l'�space apr�s le caption du tableau


%%%%
% On utilise le package caption pour d�finir le format des l�gendes
%
\captionsetup[figure]{labelfont={bf,singlespacing},justification=centering}
\captionsetup[table]{labelfont=normalfont,labelsep=quad,justification=centering,skip=1cm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Etant donne que la commande \captionsetup{list=no} n a pas marche pour enlever les legendes
% des figures et des tableaux des listes de figures et tableau, je triche en declarant un nouveau
% float pour les annexes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareCaptionType{figureap}[Figure]
\captionsetup[figureap]{labelfont=bf,justification=centering}
\renewenvironment{figureap}[1][]{%
  \@float{figureap}%
  \centering
}{%
  \end@float
}
\renewcommand{\thefigureap}{A{\Roman{chapter}-\arabic{figureap}}}


\DeclareCaptionType{tableap}[Tableau]
\captionsetup[tableap]{labelfont=normalfont,labelsep=quad,justification=centering,skip=1cm}
\renewenvironment{tableap}[1][]{%
  \@float{tableap}%
%  \footnotesize
  \centering
}{%
  \end@float
}
\renewcommand{\thetableap}{A{\Roman{chapter}-\arabic{tableap}}}

%\def\tablestring{table}%
%\def\figurestring{figure}%
%\def\listingstring{listing}%
%%\def\algorithmstring{algorithme}%
%\long\def\@makecaption#1#2#3{%
%\ifx\figurestring#3%
%  \vskip\abovecaptionskip%
%  \linespread{1}
%  \sbox\@tempboxa{\normalsize\parbox[t]{\largetiqfig}{\bfseries#1}\bfseries#2}%
%  \ifdim \wd\@tempboxa <\hsize
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \else
%    \sbox\@tempboxa{\normalsize\parbox[t]{\larglegendfig}{\centering \parbox[t]{\largetiqfig}{\bfseries#1}\bfseries#2}}%
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
%  \vskip\belowcaptionskip%
%\else
%  \ifx\tablestring#3
%    %% Pour enlever l'�space apr�s le caption du tableau ...plus besoin
%%    \setlength{\tempabovecaptionskip}{\abovecaptionskip}
%%    \setlength{\abovecaptionskip}{-0.4cm}
%    
%    \vskip \belowcaptionskip%
%    \begin{center}
%      \renewcommand{\baselinestretch}{1}\small\normalsize%
%      {\normalsize #1 \ \ #2}\par%
%%      {\normalsize #1}\par%
%%      \vskip 12\p@%
%%      {\normalsize #2}\par%
%    \end{center}
%    \vskip
%    \abovecaptionskip%
%
%%    \setlength{\abovecaptionskip}{\tempabovecaptionskip} %%r�prends l'ancienne valeur
%  %% Pascal Giard - Ajout support pour les captions autres que table et figure
%  \else
%    \vskip\abovecaptionskip
%    \linespread{1}
%    \sbox\@tempboxa{\normalsize\parbox[t]{\largetiqfig}{\bfseries#1}\bfseries#2}%
%    \ifdim \wd\@tempboxa <\hsize
%      \global \@minipagefalse
%      \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%    \else
%      \sbox\@tempboxa{\normalsize\parbox[t]{\larglegendfig}{\centering \parbox[t]{\largetiqfig}{\bfseries#1}\bfseries#2}}%
%      \global \@minipagefalse
%      \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%    \fi
%    \vskip\belowcaptionskip
%  \fi
%\fi
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Num�rotation des annexes en chiffres arabes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\appendix}{
  \par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Roman\c@chapter}

  %
  % Empeche les sections et sous sections d'etre dans la table des mati�res
  % 

  \newcommand{\numero}{\thesection}
  \newcommand{\changenumero}[1]{\renewcommand{\numero}{##1}}

  \renewcommand \thesection{\@arabic\c@section} % Enleve le numero du chapitre courant

  \def\sectionannexe{\@ifstar\unnumberedsection\numberedsection}

  \def\numberedsection{\@ifnextchar[%]
    \numberedsectionwithtwoarguments\numberedsectionwithoneargument}
  \def\unnumberedsection{\@ifnextchar[%]
    \unnumberedsectionwithtwoarguments\unnumberedsectionwithoneargument}
  \def\numberedsectionwithoneargument##1{\numberedsectionwithtwoarguments[##1]{##1}}
  \def\unnumberedsectionwithoneargument##1{\unnumberedsectionwithtwoarguments[##1]{##1}}
  \def\numberedsectionwithtwoarguments[##1]##2{%
    \ifhmode\par\fi
    \removelastskip
    \vskip .7ex \goodbreak
    \noindent
    \begingroup
      \leavevmode\Large\bfseries\raggedright
      \normalsize\bfseries
      \numero\quad
      ##2
      \par
    \endgroup
    \vskip .7ex \nobreak
  }
  \def\unnumberedsectionwithtwoarguments[##1]##2{%
    \ifhmode\par\fi
    \removelastskip
    \vskip .7ex\goodbreak
    \noindent
    \begingroup
      \leavevmode\normalfont\Large\bfseries\raggedright
      \leavevmode\normalfont\Large\bfseries\raggedright
      \normalsize\bfseries
      ##2
      \par
    \endgroup
    \vskip .7ex\nobreak
  }
  \def\section{\refstepcounter{section}\changenumero{\thesection} \sectionannexe}
  \def\subsection{\refstepcounter{subsection}\changenumero{\thesubsection} \sectionannexe}
  \def\subsubsection{\refstepcounter{subsubsection}\changenumero{\thesubsubsection} \sectionannexe}
  \def\paragraph{\refstepcounter{paragraph}\changenumero{\theparagraph} \sectionannexe}
  \def\subparagraph{\refstepcounter{subparagraph}\changenumero{\thesubparagraph} \sectionannexe}

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Pour une bonne mise en page des annexes
  %% ANNEXE doit apparaitre dans la table des matieres lors de sa premiere apparition
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  \newcommand{\nameannexe}{\appendixname}
  \newcommand{\multiannexe}{
    \renewcommand{\nameannexe}{ANNEXES}
    
    \widowpenalty=10000
\clubpenalty=10000
\raggedbottom

  }

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Changement dans la table des mati�res 
  %% des entr�es associ�es aux annexes
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% 
  %% COMME D�FINI PAR SEB 
  %% Utilisez ceci si vous voulez que 
  %% la Table des Matieres soit comme ca: 
  %% RECOMMANDATION(S)
  %% ANNEXES
  %%    1: Titre Annexe 1 
  %%    2: Titre Annexe 1 
  %\def\@chapter[##1]##2{
  %  \ifnum \c@secnumdepth >\m@ne%
  %    \if@mainmatter%
  %      \refstepcounter{chapter}%
  %      \ifthenelse{\equal{\value{chapter}}{1}}{
  %        \addcontentsline{toc}{part}{\MakeUppercase{\nameannexe}}
  %        \addtocontents{toc}{\protect\addvspace{10\p@}}
  %      }{}
  %      \typeout{\@chapapp\space\thechapter} 
  %      \addcontentsline{toc}{section}{\thechapter : ##1}
  %    \else%
  %      \addcontentsline{toc}{section}{##1}%
  %    \fi%
  %  \else%
  %    \addcontentsline{toc}{section}{##1}%
  %  \fi%
  %  \chaptermark{##1}%
  %  \@makechapterhead{##2}%
  %  \@afterheading%
  %}%
  %% MODIFI� PAR LUIS 
  %% Utilisez ceci si vous voulez que 
  %% la Table des Matieres soit comme ca: 
  %% RECOMMANDATION(S)
  %% ANNEXE 1           Titre Annexe 1 
  %% ANNEXE 2           Titre Annexe 2  
%  \def\@chapter[##1]##2{
%    \ifnum \c@secnumdepth >\m@ne%
%      \if@mainmatter%
%        \refstepcounter{chapter}%
%        \ifthenelse{\equal{\value{chapter}}{1}}{
%          %\addcontentsline{toc}{part}{\MakeUppercase{\nameannexe}}
%          \addtocontents{toc}{\protect\addvspace{10\p@}}
%        }{}
%        \typeout{\@chapapp\space\thechapter}  
%        %\addcontentsline{toc}{section}{\MakeUppercase{\appendixname}~\thechapter : ##1}
%        \addcontentsline{toc}{chapter}{\MakeUppercase{\appendixname}~\thechapter ~  ##1}
%      \else%
%        \addcontentsline{toc}{section}{##1}%
%      \fi%
%    \else%
%      \addcontentsline{toc}{section}{##1}%
%    \fi%
%    \chaptermark{##1}%
%    \@makechapterhead{##2}%
%    \@afterheading%
%  }%

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  %% Modification des annexes num�rot�es
%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  \renewcommand{\@makechapterhead}[1]{{
%        \normalfont\bfseries%
%        \begin{center}
%          \MakeUppercase{\appendixname~\thechapter} % ANNEXE 1
%          \vskip 3\p@%
%          ##1 % Title of annexe
%        \end{center}
%        \thispagestyle{empty}%
%        \newpage
%        \normalfont\bfseries%
%        \begin{center}
%          \MakeUppercase{##1} % TITLE OF ANNEXE
%        \end{center}
%        \vskip 5\p@%
%        \thispagestyle{empty}
%  }}

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Modification des annexes num�rot�es        % NOUVELLE DEMANDE : PAS REPETER LE TITRE SUR LA PAGE SUIVANTE
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \renewcommand{\@makechapterhead}[1]{{
        \normalfont\bfseries%
        \begin{center}
          \MakeUppercase{\appendixname~\thechapter} % ANNEXE 1
          \vskip 3\p@%
          \MakeUppercase{##1} % Title of annexe
        \end{center}
        \thispagestyle{empty}%
%        \newpage
    %    \normalfont\bfseries%                          % NOUVELLE DEMANDE : PAS REPETER LE TITRE SUR LA PAGE SUIVANTE
%        \begin{center}
%          \MakeUppercase{##1} % TITLE OF ANNEXE
%        \end{center}
%        \vskip 5\p@%
%        \thispagestyle{empty}
  }}

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Modification des annexes sans num�ro (ne devrait pas �tre utilis�)
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \renewcommand{\@makeschapterhead}[1]{{
    \thispagestyle{empty}
        \normalfont\bfseries%
        \begin{center}
           \MakeUppercase{##1} % TITLE OF ANNEXE
        \end{center}
        \vskip 5\p@%
        \thispagestyle{empty}
  }}

}

%
% Intitul�s francais des figures, tableaux, etc.
%

\addto\captionsfrench{\def\figurename{{Figure}}}
\addto\captionsfrench{\def\tablename{{Tableau}}}
\addto\captionsfrench{\def\lstlistingname{{Extrait}}}
\addto\captionsfrench{\def\lstlistlistingname{{Liste des extraits de code}}}
\addto\captionsfrench{\def\algorithmname{{Algorithme}}}
\addto\captionsfrench{\def\listfigurename{{Liste des figures}}}
\addto\captionsfrench{\def\listalgorithmename{{Liste des algorithmes}}}
\addto\captionsfrench{\def\CaptionSeparator{{\space\space}}}
\pagestyle{myheadings}

%
% Pour avoir des citations � interligne simple
%
\renewenvironment{quote}{
  \linespread{1}\small\normalsize\list{}{\rightmargin\leftmargin}%
  \item\relax
}{\endlist \linespread{2} \small \normalsize\noindent\hspace{-0.333em}\vskip 12\p@}

%
% Bonne pr�sentation des figures et tables
%

\renewenvironment{figure}[1][]{%
  \@float{figure}%
  \centering
}{%
  \end@float
}

\renewenvironment{table}[1][]{%
  \@float{table}%
%  \footnotesize
  \centering
}{%
  \end@float
}

%
% Positionnement des flottants
%   on privil�gie htbp (here, top, bottom, next page)
%
\def\fps@figure{htbp}
\def\fps@table{htbp}

%
% �num�ration avec des lettres, align� � gauche
% Modifi'e par LUIS (defs. de \par*) 
%
\renewcommand\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter
            {\@enumctr}% 
            \itemsep 0pt%
            \parsep \parskip% 
            %\setlength{\parskip}{0ex}%
            \setlength{\partopsep}{0ex}%
            \def\makelabel##1{\hspace{-6pt}\hspace\labelsep ##1}%
        }%
  \fi} 
\renewcommand{\labelenumi}{\alph{enumi}.}

%
% Bibliographie
% Pas utilis� -St�phane Mercier

\renewcommand{\bibname}{BIBLIOGRAPHIE}

\theoremstyle{plain}
\newtheorem{definition}{Definition}[chapter]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R�d�finition de \cleardoublepage pour l'impression recto-verso
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother \clearpage{\pagestyle{empty}\cleardoublepage}