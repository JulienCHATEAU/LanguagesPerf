function merge(left, right, arr) {
  var a = 0;

  while (left.length && right.length) {
    arr[a++] = (right[0] < left[0]) ? right.shift() : left.shift();
  }
  while (left.length) {
    arr[a++] = left.shift();
  }
  while (right.length) {
    arr[a++] = right.shift();
  }
}

function mergeSort(arr) {
  var len = arr.length;

  if (len === 1) { return; }

  var mid = Math.floor(len / 2),
    left = arr.slice(0, mid),
    right = arr.slice(mid);

  mergeSort(left);
  mergeSort(right);
  merge(left, right, arr);
}

var arr = [563, 353, 321, -134, 109, -453, -236, 294, 107, 193, -398, -390, 174, -227, 509, -9, -6, 73, -385, 354, 104, 352, -311, 64, -464, 155, -530, 220, -71, 578, 296, 151, 544, -290, 346, 359, 593, -445, -478, -501, 63, -473, -480, 35, -600, 221, -569, 573, -483, 421, -45, -532, -583, 185, 86, 126, 410, -598, 223, 428, 486, -256, -196, 424, 373, 536, -63, -156, -38, 317, 272, -192, 49, 595, -253, -22, 564, 30, 398, -525, 40, -105, -25, 400, -141, -98, 543, 111, -61, 289, 427, 110, 452, 15, 141, 238, 17, 520, -59, -520, 98, 53, -155, -152, 152, 122, 130, 450, -46, -332, -157, -247, -216, -94, 535, -519, -303, 242, 70, -173, -404, -543, 347, 247, -137, -150, 395, -355, -476, -450, 101, 411, 401, -391, 315, -438, 342, 440, -562, -592, 497, 379, -415, -233, 332, -122, -576, -371, -477, -18, -260, -252, 116, 93, 441, -349, -538, 429, -273, 555, -497, 360, -540, 184, -546, 453, -223, -35, -32, 594, -214, -462, -426, -129, -470, -553, 533, -125, 576, -51, -34, -78, -272, 500, 61, 505, 444, 292, -360, -518, 88, 97, 102, -65, -500, 545, -314, 370, -526, 77, -378, -265, -320, -266, -539, -485, -33, -594, 567, 41, -147, -75, -342, -568, 55, -458, 463, 590, 38, -584, 499, 237, 145, 517, -323, 186, -472, 12, 446, -221, -50, -329, -434, 265, -31, -589, -83, -23, 556, -541, -217, 385, 140, 11, -36, 349, -140, 235, 392, 191, -153, -460, -403, -374, -308, 199, 435, -245, 586, 9, -289, 166, -255, -498, -295, 531, -181, -377, -284, -593, -27, -523, 426, 431, 510, 215, -95, 467, 498, -388, -185, -149, -588, 46, -89, 375, -198, 196, 438, 319, -128, 112, 558, -15, 298, -353, -516, -280, 201, 420, 569, 490, 481, -112, -165, 250, -441, -571, -246, 202, 507, -411, -307, 239, -249, -365, 313, -287, 307, -384, -581, 301, 62, 534, -573, 277, 287, -234, 280, -413, -505, 513, -340, -131, 52, 258, -274, -17, 389, -596, 337, 358, 5, -229, 204, -402, 48, 159, -30, 511, -406, -241, -545, 361, 138, -312, 156, -142, -528, -127, -347, -170, -102, 171, 562, -207, 283, -44, 128, 268, 493, -379, -58, -190, -228, 448, 47, -382, -208, 308, -509, 244, -172, -135, -133, -261, 477, 205, 27, 495, -179, -444, 524, -420, 95, -487, -267, -531, 162, -26];
mergeSort(arr); // arr will now: 1, 2, 3, 4, 5, 6, 7, 8, 9