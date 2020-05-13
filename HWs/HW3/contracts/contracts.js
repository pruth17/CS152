// NOTE: This library uses non-standard JS features (although widely supported).
// Specifically, it uses Function.name.

function any(v) {
  return true;
}

function isNumber(v) {
  return !Number.isNaN(v) && typeof v === 'number';
}
isNumber.expected = "number";

function isBoolean(v){
    if (v === true || v === false)
        return true;
    else
        return false;
}
isBoolean.expected = "boolean";

function isDefined(v){
    if (v === null || v === undefined)
        return false;
    else
        return true;
}
isDefined.expected = "defined";

function isString(v){
    if (typeof v === 'string' || v instanceof String)
        return true;
    else
        return false;
}
isString.expected = "string";

function isNegative(v){
    if (isNaN(v))
        return false;
    else {
        if (v >= 0 || typeof v === 'boolean')
            return false;
        else
            return true;
    }
}
isNegative.expected = "negative number";

function isPositive(v){
    if (isNaN(v))
        return false;
    else {
        if (v <= 0 || typeof v === 'boolean')
            return false;
        else
            return true;
    }
}
isPositive.expected = "positive number";

// Combinators:

function and() {
  let args = Array.prototype.slice.call(arguments);
  let cont = function(v) {
    for (let i in args) {
      if (!args[i].call(this, v)) {
        return false;
      }
    }
    return true;
  }
  cont.expected = expect(args[0]);
  for (let i=1; i<args.length; i++) {
    cont.expected += " and " + expect(args[i]);
  }
  return cont;
}


function or() {
    let temporary = Array.prototype.slice.call(arguments);
      let cont = function(v) {
          for (let i in temporary) {
              if (temporary[i].call(this, v)) {
                  return true;
              }
          }
          return false;
      }
      cont.expected = expect(temporary[0]);
    for (let i=1; i<temporary.length; i++) {
      cont.expected += " or " + expect(temporary[i]);
    }
    return cont;
};

function not(a){
    let notC = function(v) {
        let result = a.call(this, v);
        return !result;
    }
    notC.expected = "not " + a.expected;
    return notC;
};



// Utility function that returns what a given contract expects.
function expect(f) {
  // For any contract function f, return the "expected" property
  // if it is specified.  (This allows developers to specify what
  // the expected property should be in a more readable form.)
  if (f.expected) {
    return f.expected;
  }
  // If the function name is available, use that.
  if (f.name) {
    return f.name;
  }
  // In case an anonymous contract is specified.
  return "ANONYMOUS CONTRACT";
}

function contract (preList, post, f) {
//    let first = f.call(this,f.arguments);
//    if((preList.call(this, first)) === false)
//        throw "User's fault";
    return function() {
        for (let i = 0; i < preList.length; i++) {
            let val = preList[i].call(this, arguments[i]);
            if (!val)
                throw new Error("Contract violation in position " + i +
                                ". Expected " + preList[i].expected +
                                " but received " + arguments[i] +
                                ".  Blame -> Top-level code");
        }
        
        let res = f.apply(this, arguments);
        if (!post(res))
            throw new Error("Contract violation. Expected " +
                            post.expected + " but returned " +
                            res + ".  Blame -> " + f.name);
        
        return res;
    }
    let res = f.call(this, f.arguments);
    if ((post.call(this, res)) === false)
        throw "library's fault";
}


module.exports = {
  contract: contract,
  any: any,
  isBoolean: isBoolean,
  isDefined: isDefined,
  isNumber: isNumber,
  isPositive: isPositive,
  isNegative: isNegative,
  isInteger: Number.isInteger,
  isString: isString,
  and: and,
  or: or,
  not: not,
};
