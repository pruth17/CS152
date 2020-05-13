let change = {

    has: function(a, b) {

        console.log(a.constructor.name + " has " + b);

        return b in a;

    },

    get: function(a, b, r) {

        console.log(a.constructor.name + " gets " + b);

        return Reflect.get(...arguments);

    },

    set: function(a, b, c, r) {

        console.log("Set " + a.constructor.name + " " + b + " to " + c);

        a[b] = c;

        return true;

    },

    deleteProperty: function(a, b) {

        console.log("Deleted " + b + " in " + a.constructor.name);

        return delete a[b];

    },

    construct: function(target, argumentsList, newTarget) {

        console.log(" Constructing " + a.constructor.name);

        return new target(...args);

    },

    apply: function(target, thisArg, argumentsList) {

           console.log(target.constructor.name + " applied with " + thisArg + " with " + argumentsList);

           return target.apply(thisArg, argumentsList);

       },

    getOwnPropertyDescriptor: function(a, b) {

        console.log("Getting " + a.constructor.name + "'s Property Descriptor for " + b);

        return Object.getOwnPropertyDescriptor(a, b);

    },

    getPrototypeOf: function(a) {

        console.log("Getting Prototype Of " + a.constructor.name);

        return Object.getPrototypeOf(a);

    },

    setPrototypeOf: function(a, b) {

        console.log("Setting Prototype Of " + a.constructor.name + " to " + b.constructor.nam);

        return Reflect.setPrototypeOf(a, b);

    },

    isExtensible: function(a) {

        console.log(a.constructor.name + " is Extensible ");

        return Reflect.isExtensible(a);

    },

    preventExtensions: function(a) {

        console.log(a.constructor.name + " is now preventing Extensions");

        return Object.preventExtensions(a);

    },

    defineProperty: function(a, b, d) {

        console.log("Defining " + b + " for " + a.constructor.name + " to " + d);

        return true;

    },

    ownKeys: function(a) {

        console.log("Listing " + a.constructor.name + "'s own keys");

        return Reflect.ownKeys(a);

    }

}

    

function trace(obj) {

    return new Proxy(obj, change);

}

 

function TestObj1() {

    this.test1 = '1';

    this.test2 = '2';

    this.boo = 'boo';

}

 

function TestObj2() {

    this.jar = 'jar';

    __proto__: TestObj1.prototype;

}

 

function p(data) { console.log(data);}

 

function test(obj) {

    

    "test1" in obj;

    obj.test1;

    obj.boo = "jar";

    delete obj.test1;

    

    new trace(obj2).disposition;

    Object.getOwnPropertyDescriptor(obj, "test2");

    Object.getPrototypeOf(obj);

    Reflect.setPrototypeOf(obj, obj2);

    Object.isExtensible(obj);

    Object.preventExtensions(obj);

    obj.test3 = '3';

    for (let k of Object.keys(obj)) ;

}

 

let obj1 = new TestObj1();

let obj2 = new TestObj2();

test(trace(obj1));