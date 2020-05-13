function makeListOfAdders(adders) {

    var result = [];

    for (var i = 0; i < adders.length; i++) {

        result.push(function (addr) {

            return function (x) {

                return x + addr;

            }

        }(adders[i]));

    }

    return result;

}

var addrs = makeListOfAdders([3,5,9]);

console.log(addrs[0](4));

console.log(addrs[1](10));

console.log(addrs[2](9));