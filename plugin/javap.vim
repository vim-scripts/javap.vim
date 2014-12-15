" Javap, v1.0
" Runs javap to show the methods defined in the specified class
" Usage:  Javap or Javap class_name

:command -nargs=? Javap call Javap(<q-args>)
function Javap(classname)
   let save_a=@a
   let class = GetOrDefault(a:classname)
   let @a = system("javap " . class)
   if bufloaded("javap")
      edit "javap"
      normal "%d"
   else
      execute "split javap"
      setlocal noswapfile
      setlocal buftype=nowrite
      setlocal bufhidden=delete
      setlocal filetype=java
   endif
   put a
   let @a=save_a
endfunction

function GetOrDefault(classname)
   if !empty(a:classname)
      return a:classname
   else
      return substitute(expand('%:t'), ".class", "", "")
   end
endfunction
