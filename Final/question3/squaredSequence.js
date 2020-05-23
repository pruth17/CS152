
function squaredSequenceMaker() {
	var temp = 1;
  return function(){
  	return Math.pow(temp++,2);
  }
}

let seq1 = squaredSequenceMaker();

console.log(seq1());
console.log(seq1());
console.log(seq1());
console.log(seq1());
console.log(seq1());
console.log(seq1());
console.log(seq1());

let seq2 = squaredSequenceMaker();

console.log(seq2());
console.log(seq2());
console.log(seq1());
console.log(seq2());
console.log(seq2());
console.log(seq1());

