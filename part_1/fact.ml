let fact n = 
  let rec helper n acc = 
    if n = 0 then acc 
    else helper (n - 1) (n * acc)
  in
  helper n 1
;;

let () = Printf.printf "fact 5 = %d\n" (fact 5)
(* let () = Printf.printf "add 2 9 = %d\n" (Add.add 2 9) *)
