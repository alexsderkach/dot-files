function! Browser ()
  let line0 = getline (".")
  let line = matchstr (line0, "http[^ )]*")
  let line = escape (line, "#?&;|%")
  exec ':silent !open ' . "\"" . line . "\""
endfunction

function! Enumerate ()
  silent! :%s/^/\=printf('%3d. ', line('.'))
endfunction
