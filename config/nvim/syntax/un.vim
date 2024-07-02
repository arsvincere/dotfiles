" Vim syntax file
" Language:        un
" Maintainer:      @arsvincere on GitHub
" URL:             http://arsvincere.com
" Licence:         GPL (http://www.gnu.org)
" Last Update:     2024 June 20


if exists("b:current_syntax")
  finish
endif

syn match   unHeader1 /^[^. +/].*[^.]\n[*]\{3,}$/ 
syn match   unHeader2 /^[^. +/].*[^.]\n[=]\{3,}$/ 
syn match   unHeader3 /^[^. +/].*[^.]\n[-]\{3,}$/ 
syn match   unHeader4 /^[^. +/].*[^.]\n[:]\{3,}$/ 
syn match   unHeader5 /^[^. +/].*[^.]\n[.]\{3,}$/ 
syn match   unHeader6 /^[^. +/].*[^.]\n[,]\{3,}$/ 

syn match   unHeader1 /^=\{1}\s\+\S.*$/ 
syn match   unHeader2 /^=\{2}\s\+\S.*$/ 
syn match   unHeader3 /^=\{3}\s\+\S.*$/ 
syn match   unHeader4 /^=\{4}\s\+\S.*$/ 
syn match   unHeader5 /^=\{5}\s\+\S.*$/ 
syn match   unHeader6 /^=\{6}\s\+\S.*$/ 

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

hi unHeader1    guifg=#FF5D62 gui=bold
hi unHeader2    guifg=#FFA066 gui=bold
hi unHeader3    guifg=#DCA561 gui=bold
hi unHeader4    guifg=#76946A gui=bold
hi unHeader5    guifg=#658594 gui=bold
hi unHeader6    guifg=#2D4F67 gui=bold

hi unListBullet guifg=#FF9E3B
hi unListNumber guifg=#FF9E3B

hi unBold       guifg=#938056 gui=none
hi unItalic     guifg=#938056 gui=none
hi unUnderline  guifg=#938056 gui=none
hi unCross      guifg=#938056 

hi unLink       guifg=#957FB8
hi unQuote      guifg=#6A9589

hi unKeyword    guifg=#D27E99



" hi Comment              guifg=#99968b gui=italic
" hi Todo                 guifg=#8f8f8f gui=italic
" hi Constant     guifg=#8a11a8 gui=none
" hi String               guifg=#95e454 gui=italic
" hi Identifier   guifg=#cae682 gui=none
" hi Function     guifg=#cae682 gui=none
" hi Type                 guifg=#cae682 gui=none
" hi Statement    guifg=#8ac6f2 gui=none
" hi Keyword              guifg=#8ac6f2 gui=none
" hi PreProc              guifg=#e5786d gui=none
" hi Number               guifg=#e5786d gui=none
" hi Special              guifg=#e7f6da gui=none
" hi Delimiter    guifg=#e5786d gui=none


let b:current_syntax = "un"

