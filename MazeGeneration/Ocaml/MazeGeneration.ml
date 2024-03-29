let seen = Hashtbl.create 7
let mark t = Hashtbl.add seen t true
let marked t = Hashtbl.mem seen t
 
let walls = Hashtbl.create 7
let ord a b = if a <= b then (a,b) else (b,a)
let join a b = Hashtbl.add walls (ord a b) true
let joined a b = Hashtbl.mem walls (ord a b)
 
let () =
  let nx = 50 in
  let ny = 40 in
 
  let shuffle lst =
     let nl = List.map (fun c -> (Random.bits (), c)) lst in
     List.map snd (List.sort compare nl) in
 
  let get_neighbours (x,y) =
    let lim n k = (0 <= k) && (k < n) in
    let bounds (x,y) = lim nx x && lim ny y in
    List.filter bounds [(x-1,y);(x+1,y);(x,y-1);(x,y+1)] in
 
  let rec visit cell =
    mark cell;
    let check k =
      if not (marked k) then (join cell k; visit k) in
    List.iter check (shuffle (get_neighbours cell)) in
 
  let print_maze () =
    begin
    for i = 1 to nx do print_string "+---";done; print_endline "+";
    let line n j k l s t u =
      for i = 0 to n do print_string (if joined (i,j) (i+k,j+l) then s else t) done;
      print_endline u in
    for j = 0 to ny-2 do
      print_string "|   ";
      line (nx-2) j 1 0 "    " "|   " "|";
      line (nx-1) j 0 1 "+   " "+---" "+";
    done;
    print_string "|   ";
    line (nx-2) (ny-1) 1 0 "    " "|   " "|";
    for i = 1 to nx do print_string "+---";done; print_endline "+";
   end in
 
  Random.self_init();
  visit (Random.int nx, Random.int ny);
  print_maze ();