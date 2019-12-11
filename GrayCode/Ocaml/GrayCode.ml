let gray_encode b =
  b lxor (b lsr 1)

let gray_decode n =
  let rec aux p n =
    if n = 0 then p
    else aux (p lxor n) (n lsr 1)
  in
  aux n (n lsr 1)

let bool_string len n =
  let s = String.make len '0' in
  let rec aux i n =
    if n land 1 = 1 then s.[i] <- '1';
    if i <= 0 then s
    else aux (pred i) (n lsr 1)
  in
  aux (pred len) n

  let rec pow a = function
  | 0 -> 1
  | 1 -> a
  | n ->
    let b = pow a (n / 2) in
    b * b * (if n mod 2 = 0 then 1 else a)

  let () =
    for i = 0 to pred (pow 2 20) do
      let g = gray_encode i in
      gray_decode g
    done
