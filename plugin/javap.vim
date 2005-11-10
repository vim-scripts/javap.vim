" Javap, v1.0

" Runs javap to show the methods defined in the specified class
" Usage:  Javap class_name
:command -nargs=1 Javap call Javap(<f-args>)
function Javap(classname)
   let save_a=@a
   let @a = system("javap " . a:classname)
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

