% MIT License
%
% Copyright (c) 2018 Ethan Cecchetti
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
%  Note that if the title is too long, things might not look great (it doesn't
%  vertically center).
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

\def\fileversion{1.3}
\def\filedate{2020/08/10}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nsf-grfp}[\filedate\space Version \fileversion\space by Ethan Cecchetti]

\LoadClass[11pt,onecolumn,oneside,final]{article}

\RequirePackage{mathptmx}
\RequirePackage[scaled=.90]{helvet}
\RequirePackage{inconsolata}
\RequirePackage{sectsty}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{calc}
\RequirePackage{microtype}
\RequirePackage[letterpaper,margin=1in]{geometry}

\frenchspacing

% New configurable length values
\newlength{\titlegap}
\newlength{\secpargap}
\newlength{\secskipabove}
\newlength{\secskipbelow}
\newlength{\subsecskipabove}
\newlength{\subsubsecskipabove}

% Default values for configurable lengths
\setlength{\titlegap}{0em}
\setlength{\secpargap}{0.8em \@plus 0.2em \@minus 0.2em}
\setlength{\secskipabove}{1em \@plus 0.5ex \@minus 0.5ex}
\setlength{\secskipbelow}{0.25em \@plus 0.5ex \@minus 0.5ex}
\setlength{\subsecskipabove}{1em \@plus 0.5ex \@minus 0.2ex}
\setlength{\subsubsecskipabove}{0.5em \@plus 0.5ex \@minus 0.2ex}

\advance\year by 1
\edef\@TheNextYear{\the\year}
\advance\year by -1

\def\maketitle{%
  \newcommand\@DateText{NSF GRFP \@TheNextYear}%
  \newlength{\@titlewidth}%
  \setlength{\@titlewidth}{\textwidth - \maxof{\widthof{\@author}}{\widthof{\@DateText}}*2}%
  \addtolength{\@titlewidth}{-2em}%
  %
  \begin{center}%
  {\@author}\hfill{\@DateText}\\[-\baselineskip]%
  \parbox[t]{\@titlewidth}{\centering\bfseries\@title}%
  \vspace{\titlegap}%
  \end{center}%
}

\setlength{\bibsep}{0.5ex plus 0.3ex}

% Change how sections are rendered so that they are inline.
\def\section{%
  \@startsection{section}{1}{\z@}%
                {-\secskipabove}{\secskipbelow}%
                {\normalfont\normalsize\bfseries}%
}
\def\subsection{%
  \@startsection{subsection}{1}{\z@}%
                {-\subsecskipabove}{-\secpargap}%
                {\normalfont\normalsize\bfseries}%
}
\def\subsubsection{%
  \@startsection{subsubsection}{1}{\z@}%
                {-\subsubsecskipabove}{-\secpargap}%
                {\normalfont\normalsize\bfseries}%
}
\def\paragraph{%
  \@startsection{paragraph}{1}{\z@}%
                {0em}{-\secpargap}%
                {\normalfont\normalsize\bfseries}*%
}

\def\bibfont{\fontsize{10}{12}\selectfont}
