" Vim syntax file
" Language:        un
" Maintainer:      @arsvincere on GitHub
" URL:             http://arsvincere.com
" Licence:         GPL (http://www.gnu.org)
" Last Update:     2024 June 20


if exists("b:current_syntax")
  finish
endif

syn match   FoldMarker	/{{{/ contained
syn match   FoldMarker	/}}}/

syn match   unHeader1 /^[^. +/].*[^.]\n[*]\{3,}$/
syn match   unHeader2 /^[^. +/].*[^.]\n[=]\{3,}$/
syn match   unHeader3 /^[^. +/].*[^.]\n[-]\{3,}$/
syn match   unHeader4 /^[^. +/].*[^.]\n[:]\{3,}$/
syn match   unHeader5 /^[^. +/].*[^.]\n[.]\{3,}$/
syn match   unHeader6 /^[^. +/].*[^.]\n[,]\{3,}$/

syn match   unHeader1 /^=\{1}\s\+\S.*$/ contains=FoldMarker
syn match   unHeader2 /^=\{2}\s\+\S.*$/ contains=FoldMarker
syn match   unHeader3 /^=\{3}\s\+\S.*$/ contains=FoldMarker
syn match   unHeader4 /^=\{4}\s\+\S.*$/ contains=FoldMarker
syn match   unHeader5 /^=\{5}\s\+\S.*$/ contains=FoldMarker
syn match   unHeader6 /^=\{6}\s\+\S.*$/ contains=FoldMarker

" syn match unListBullet /^\s*\zs\(-\+\|\*\{1,5}\)\ze\s/
syn match   unListBullet /^\s*\zs\(-\|\*\{1,5}\)\ze\s/
syn match   unListNumber /^\s*\zs\(\(\d\+\.\)\|\.\{1,5}\|\(\a\.\)\|\([ivxIVX]\+)\)\)\ze\s\+/

syn match   unBold /\\\@<!\*\*\S\_.\{-}\(\*\*\|\n\s*\n\)/
syn match   unItalic /\\\@<!\/\/\S\_.\{-}\(\/\/\|\n\s*\n\)/
syn match   unUnderline /\\\@<!__\S\_.\{-}\(__\|\n\s*\n\)/
syn match   unCross /\\\@<!\-\-\S[^-]\_.\{-}\(\-\-\|\n\s*\n\)/

syn match   unLink /\\\@<!::\S\_.\{-}\(::\|\n\s*\n\)/
syn region  unQuote start=/"""/ skip=/\\"""/ end=/"""/

syn keyword unKeyword TITLE AUTHOR CREATED DATE TIME LOCATION FILE URL EMAIL
syn keyword unKeyword PROJECT TARGET TASK DO
syn keyword unKeyword TODO NOTE FIX HACK CHECK TEST
syn keyword unKeyword GIT BRIEF DRAFT ISSUE DEPRECATED VERSION LICENSE


"_____________________________________________________________________________

hi unHeader1    guifg=#E46876 gui=bold
hi unHeader2    guifg=#b98d7b gui=bold
hi unHeader3    guifg=#c4b28a gui=bold
hi unHeader4    guifg=#8ba4b0 gui=bold
hi unHeader5    guifg=#658594 gui=bold
hi unHeader6    guifg=#a292a3 gui=bold

hi unListBullet guifg=#DCA561
hi unListNumber guifg=#DCA561

hi unBold       guifg=#938056 gui=none
hi unItalic     guifg=#938056 gui=none
hi unUnderline  guifg=#938056 gui=none
hi unCross      guifg=#938056

hi unLink       guifg=#957fb8
hi unQuote      guifg=#87a987

hi unKeyword    guifg=#d27e99

hi foldMarker   guifg=#181616 gui=italic

let b:current_syntax = "un"

