function makeDebugWrapperApply (f , thisObj) {

    return function () {

        console.log("Passing " + arguments[0] + " " + arguments[1]);

        console.log("Returning " + (arguments[0] + arguments[1]));

       return f.apply(null,[arguments[0],arguments[1]]);

        

    }

}

function add (x,y) {

    return x+ y;

}

 

console.log(add(3,4));

var addWrapped = makeDebugWrapperApply(add);

console.log(addWrapped(8,14));