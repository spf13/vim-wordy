" =============================================================================
" File:        plugin/wordy.vim
" Description: Usage support for the Vim text editor
" Maintainer:  Reed Esau <github.com/reedes>
" Last Change: January 14, 2014
" License:     The MIT License (MIT)
" =============================================================================

if exists('g:loaded_wordy') || &cp | finish | endif
let g:loaded_wordy = 1

" Save 'cpoptions' and set Vim default to enable line continuations.
let s:save_cpo = &cpo
set cpo&vim

" need directory to manage spell files
let g:wordy_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

command -nargs=0 NoWordy           call wordy#init({})

command -nargs=0 BeingWordy        call wordy#init({ 'd': 'being' })
command -nargs=0 PassiveWordy      call wordy#init({ 'd': ['passive-voice', 'being',] })

command -nargs=0 WeakWordy         call wordy#init({ 'd': 'weak' })
command -nargs=0 LazyWordy         call wordy#init({ 'd': 'weak' })

command -nargs=0 ProblemWordy      call wordy#init({ 'd': 'problematic' })
command -nargs=0 WordyWordy        call wordy#init({ 'd': 'redundant' })

command -nargs=0 JargonWordy       call wordy#init({ 'd': 'business-jargon' })
command -nargs=0 ArtJargonWordy    call wordy#init({ 'd': 'art-jargon' })
command -nargs=0 PuffWordy         call wordy#init({ 'd': 'puffery' })
command -nargs=0 WeaselWordy       call wordy#init({ 'd': 'weasel' })

command -nargs=0 TriteWordy        call wordy#init({ 'd': ['colloquial', 'idiomatic', 'similies',] })

" tools for formal and objective writing
command -nargs=0 VagueTimeWordy    call wordy#init({ 'd': 'vague-time' })
command -nargs=0 OpineWordy        call wordy#init({ 'd': 'opinion' })
command -nargs=0 SaidWordy         call wordy#init({ 'd': 'said-synonyms' })
command -nargs=0 AintWordy         call wordy#init({ 'd': 'contractions' })

command -nargs=0 NextWordy         call wordy#jump(1)
command -nargs=0 PrevWordy         call wordy#jump(-1)

let g:wordy_ring_index = -1     " start at beginning

" user configurable ring of dictionaries
if !exists('g:wordy#ring')
  let g:wordy#ring = [
    \ 'weak',
    \ ['being', 'passive-voice', ],
    \ 'business-jargon',
    \ 'weasel',
    \ 'puffery',
    \ ['problematic', 'redundant', ],
    \ ['colloquial', 'idiomatic', 'similies', ],
    \ ]
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:ts=2:sw=2:sts=2
