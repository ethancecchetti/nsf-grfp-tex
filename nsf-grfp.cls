% MIT License
%
% Copyright (c) 2016 Ethan Cecchetti
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%
% =============================================================================
%
% This package formats text to conform to the NSF GRFP formatting guidelines
% with minimal extra space.
%
% Noes and Usage:
%  The title is compacted and placed entirely in one line, so use \maketitle.
%  Note that if the title is too long, things will overwrite each other.
%
%  All section headers will be normal size and everything except \section will
%  be inlined with the beginning of the paragraph.
%  I recommend using \subsection* (unnumbered inlined section, a lot like \paragraph{})
%    The difference between the number of "subs" is how much space is before the paragraph.
%
%  The following lengths can be set to add more compression as necessary:
%    \titlegap - This increases (or decreases) the gap between the title and first paragraph.
%    \secpargap - This specifies the gap between a section header and the first
%                 character of its first paragraph (which are on the same line).
%    \secskipabove       - The space above a new section's header.
%                          This will also affect the References header.
%    \secskipbelow       - The space below a new section's header.
%                          This will also affect the References header.
%    \subsecskipabove    - The space above a new subsection's header and first paragraph.
%    \subsubsecskipabove - The space above a new subsubsection's header and first paragraph.
%
% =============================================================================

\def\fileversion{1.0}
\def\filedate{2016/10/17}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nsf-grfp}[\filedate\space Version \fileversion\space by Ethan Cecchetti]

\LoadClass[letterpaper,12pt,onecolumn,oneside,final]{article}

\RequirePackage{mathptmx}
\RequirePackage[scaled=.90]{helvet}
\RequirePackage{courier}
\RequirePackage{sectsty}
\RequirePackage{natbib}

% New configurable length values
\newlength{\titlegap}
\newlength{\secpargap}
\newlength{\secskipabove}
\newlength{\secskipbelow}
\newlength{\subsecskipabove}
\newlength{\subsubsecskipabove}

% Default values for configurable lengths
\setlength{\titlegap}{0em}
\setlength{\secpargap}{1em \@plus 0.2em \@minus 0.2em}
\setlength{\secskipabove}{1em \@plus 0.5ex \@minus 0.5ex}
\setlength{\secskipbelow}{0.25em \@plus 0.5ex \@minus 0.5ex}
\setlength{\subsecskipabove}{1em \@plus 0.5ex \@minus 0.2ex}
\setlength{\subsubsecskipabove}{0.5em \@plus 0.5ex \@minus 0.2ex}

% Set margins to 1 inch on every side
\setlength\topmargin{0pt}
\addtolength\topmargin{-\headheight}
\addtolength\topmargin{-\headsep}
\setlength\oddsidemargin{0pt}
\setlength\textwidth{\paperwidth}
\addtolength\textwidth{-2in}
\setlength\textheight{\paperheight}
\addtolength\textheight{-2in}

\newcommand{\NextYear}{\advance\year by 1 \the\year\advance\year by -1}

\renewcommand{\maketitle}{%
  \begin{center}%
  {\@author}\hfill{NSF GRFP \NextYear}\\[-\baselineskip]%
  {\bfseries\@title}%
  \vspace{\titlegap}%
  \end{center}%
}

\sectionfont{\fontsize{12}{12}\selectfont}
\setlength{\bibsep}{0.5ex plus 0.3ex}

% Change how sections are rendered so that they are inline.
\renewcommand{\section}{%
  \@startsection{section}{1}{\z@}%
                {-\secskipabove}{\secskipbelow}%
                {\normalfont\normalsize\bfseries}%
}
\renewcommand{\subsection}{%
  \@startsection{subsection}{1}{\z@}%
                {-\subsecskipabove}{-\secpargap}%
                {\normalfont\normalsize\bfseries}%
}
\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{1}{\z@}%
                {-\subsubsecskipabove}{-\secpargap}%
                {\normalfont\normalsize\bfseries}%
}
\renewcommand{\paragraph}{%
  \@startsection{paragraph}{1}{\z@}%
                {0em}{-\secpargap}%
                {\normalfont\normalsize\bfseries}*%
}

\renewcommand{\bibfont}{\footnotesize}